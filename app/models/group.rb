class Group < ActiveRecord::Base

  belongs_to :creator, class_name: 'User'

  has_many :comments, as: :commentable
  
  has_many :group_users

  has_many :users, through: :group_users

  def last_ten_comments
    comments.order(:created_at).reverse_order.limit(10)
  end

end
