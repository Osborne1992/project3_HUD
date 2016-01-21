class CommentsController < ApplicationController

  load_and_authorize_resource

    def index
      @comments = Comment.all.order(:created_at)
    end

    def show
      @comment = find_comment
    end

    def new
      @comment = current_user.comments.new
    end

    def create
      comment = current_user.created_comments.create(comment_params)
      redirect_to( comment_path( comment.id ) )
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

    def find_comment
      Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:creator_id, :event_id, :group_id, :review_id, :tournament_id, :user_id, :body, :plus_one, :minus_one)
    end

end