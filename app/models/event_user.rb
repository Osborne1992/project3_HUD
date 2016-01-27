class EventUser < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  validates :user, uniqueness: true

end
