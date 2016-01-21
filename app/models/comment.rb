class Comment < ActiveRecord::Base
  belongs_to :event
  belongs_to :group
  belongs_to :review
  belongs_to :tournament
  belongs_to :user

  has_and_belongs_to_many :comments

end
