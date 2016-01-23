class postsController < ApplicationController

  load_and_authorize_resource

  def index
    @posts = Post.all.order(:name)
  end

  def show
    @post = find_post
  end

  def new
    @post = current_user.posts.new
  end

  def create
    post = current_user.created_posts.create(post_params)
    redirect_to( post_path( post.id ) )
  end

  def destroy
    post = find_post
    post.destroy
    redirect_to(posts_path)
  end

  def edit
    @post = find_post
  end

  def update
    post = find_post
    post.update(post_params)
    redirect_to(post_path(post.id))
  end

  private

  def find_post
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :text, :creator_id)
  end

end