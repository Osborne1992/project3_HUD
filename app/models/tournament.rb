class Tournament < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  belongs_to :platform
  belongs_to :game

  has_many :comments, as: :commentable
  
  has_many :event_tournaments
  has_many :tournament_users

  has_many :events, through: :event_tournaments
  has_many :users, through: :tournament_users

  def last_ten_comments
    comments.order(:created_at).reverse_order.limit(10)
  end

end
