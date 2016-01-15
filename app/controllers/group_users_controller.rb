class GroupUsersController < ApplicationController

  def index

  end

  commentable = Post.create
  comment = commentable.comments.create
  comment.title = "First comment."
  comment.comment = "This is the first comment."
  comment.save

end