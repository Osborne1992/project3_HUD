class Platform < ActiveRecord::Base
  has_many :reviews

  has_many :games, through: :game_platforms
end
