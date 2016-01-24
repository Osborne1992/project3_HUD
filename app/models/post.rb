class Post < ActiveRecord::Base
  belongs_to :user

  has_many :comments, as: :commentable

  has_many :post_images

end
