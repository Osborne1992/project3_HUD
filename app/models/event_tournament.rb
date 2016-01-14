class EventTournament < ActiveRecord::Base
  belongs_to :event
  belongs_to :tournament
end
