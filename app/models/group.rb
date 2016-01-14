class Group < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :users, through: :group_users
end
