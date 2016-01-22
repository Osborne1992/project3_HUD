class CommentsController < ApplicationController

  load_and_authorize_resource

  def index
    @commentable = find_commentable
    @comments = @commentable.comments.order(:created_at)
  end

  def show
    @comment = find_comment
  end

  def new
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    @comment.creator = current_user
    if @comment.save
      flash[:notice] = "Successfully saved comment."
      redirect_to @commentable
    else
      render 'new'
    end
  end

  def destroy
    comment = find_comment
    comment.destroy
    redirect_to(comments_path)
  end

  def edit
    @comment = find_comment
  end

  def update
    comment = find_comment
    comment.update(comment_params)
    redirect_to(comment_path(comment.id))
  end

  private
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
  end

  def find_comment
    Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :plus_one, :minus_one)
  end

end