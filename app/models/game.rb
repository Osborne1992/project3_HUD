class Game < ActiveRecord::Base
  has_many :reviews
  
  has_many :platforms, through: :game_platforms
  has_many :tournmanets, through: :game_tournaments
end
