class Event < ActiveRecord::Base

  has_many :tournaments, through: :event_tournaments
  has_many :users, through: :event_users

end
