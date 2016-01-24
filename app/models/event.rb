class Event < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:name, :host, :location]

  belongs_to :creator, class_name: 'User'

  has_many :comments, as: :commentable
  
  has_many :event_tournaments
  has_many :event_users

  has_many :tournaments, through: :event_tournaments
  has_many :users, through: :event_users


  def last_ten_comments
    comments.order(:created_at).reverse_order.limit(10)
  end

end

