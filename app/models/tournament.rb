class Tournament < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  belongs_to :platform
  belongs_to :game

  has_many :comments
  
  has_many :event_tournaments
  has_many :tournament_users

  has_many :events, through: :event_tournaments
  has_many :users, through: :tournament_users

  acts_as_commentable

end
