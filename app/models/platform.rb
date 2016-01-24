class Platform < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:name, :owner]

  has_many :reviews
  has_many :tournaments

  has_many :game_platforms
  has_many :platform_users

  has_many :games, through: :game_platforms
  has_many :users, through: :platform_users
end
