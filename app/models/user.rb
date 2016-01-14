class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :reviews

  has_many :events, through: :event_users
  has_many :tournaments, through: :tournament_users
  has_many :platforms, through: :platform_users


  has_and_belongs_to_many :private_messages

  def private_messages
    PrivateMessage.where("private_messages.sender_id = :id OR private_messages.recipient_id = :id", id: id).order(:created_at)
  end


  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }

end