class Tournament < ActiveRecord::Base
  belongs_to :host, class_name: 'User'
  belongs_to :platform

  has_many :comments
  
  has_many :event_tournaments
  has_many :tournament_users
  has_many :game_tournaments

  has_many :events, through: :event_tournaments
  has_many :users, through: :tournament_users
  has_many :games, through: :game_tournaments

  acts_as_commentable

end
