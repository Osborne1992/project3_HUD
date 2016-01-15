class Review < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  belongs_to :platform

  has_many :comments

  acts_as_commentable

end
