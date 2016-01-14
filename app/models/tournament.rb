class Tournament < ActiveRecord::Base
  belongs_to :platform

  has_many :events, through: :event_tournaments
  has_many :users, through: :tournament_users
  has_many :games, through: :game_tournaments
end
