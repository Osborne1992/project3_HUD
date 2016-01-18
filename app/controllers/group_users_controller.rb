class GroupUsersController < ApplicationController

  load_and_authorize_resource

  def index

  end

  commentable = Post.create
  comment = commentable.comments.create
  comment.title = "First comment."
  comment.comment = "This is the first comment."
  comment.save

end