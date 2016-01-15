class Game < ActiveRecord::Base
  has_many :reviews
  has_many :game_platforms
  has_many :game_tournaments
  has_many :game_users
  
  has_many :platforms, through: :game_platforms
  has_many :tournmanets, through: :game_tournaments
  has_many :users, through: :game_users
end
