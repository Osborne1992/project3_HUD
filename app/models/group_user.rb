class GroupUser < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  validates :user, uniqueness: true

end
