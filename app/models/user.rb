class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, 
  :validatable

  # attr_accessor :slug

  # extend FriendlyId
  # friendly_id :username, use: :slugged
  
  has_many :comments
  has_many :reviews
  has_many :created_groups, class_name: 'Group', foreign_key: :creator_id
  has_many :created_events, class_name: 'Event', foreign_key: :creator_id
  has_many :created_tournaments, class_name: 'Tournament', foreign_key: :creator_id

  has_many :group_users
  has_many :event_users
  has_many :tournament_users
  has_many :platform_users
  has_many :game_users
  has_many :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"

  has_many :groups, through: :group_users
  has_many :events, through: :event_users
  has_many :tournaments, through: :tournament_users
  has_many :platforms, through: :platform_users
  has_many :games, through: :game_users
  has_many :friends, through: :friendships
  has_many :inverse_friends, through: :inverse_friendships, :source => :user


  has_and_belongs_to_many :private_messages

  acts_as_commentable

  def private_messages
    PrivateMessage.where("private_messages.sender_id = :id OR private_messages.recipient_id = :id", id: id).order(:created_at)
  end


  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, :case_sensitive => false
  validate :validate_username

  validates :email, uniqueness: true

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
    conditions[:email].downcase! if conditions[:email]
    where(conditions.to_h).first
  end

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end


  private
  def set_default_role
    self.role ||= Role.find_by_name('registered')
  end

end