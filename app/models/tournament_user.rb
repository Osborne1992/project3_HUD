class TournamentUser < ActiveRecord::Base
  belongs_to :tournament
  belongs_to :user

  validates :user, uniqueness: true

end
