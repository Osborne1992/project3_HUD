class Event < ActiveRecord::Base
  belongs_to :host, class_name: 'User'

  has_many :event_tournaments
  has_many :event_users

  has_many :tournaments, through: :event_tournaments
  has_many :users, through: :event_users

end
