class PlatformUsersController < ApplicationController

  load_and_authorize_resource

  def index
    @platform_users = PlatformUser.all.order(:name)
  end

  def show
    @platform_user = find_platform_user
  end

  def new
    @platform_user = current_user.platform_users.new
  end

  def create
    platform_user = current_user.created_platform_users.create(platform_user_params)
    redirect_to( platform_user_path( platform_user.id ) )
    binding.pry
  end

  def destroy
    platform_user = find_platform_user
    platform_user.destroy
    redirect_to(platform_users_path)
  end

  def edit
    @platform_user = find_platform_user
  end

  def update
    platform_user = find_platform_user
    platform_user.update(platform_user_params)
    redirect_to(platform_user_path(platform_user.id))
    binding.pry
  end

  private

  def find_platform_user
    PlatformUser.find(params[:id])
  end

  def platform_user_params
    params.require(:platform_user).permit(:user_id, :platform_id)
  end

end