class PlatformsController < ApplicationController

  load_and_authorize_resource

  def index
    @platforms = Platform.all.order(:name)
  end

  def show
    @platform = find_platform
  end

  def new
    @platform = Platform.new
  end

  def create
    platform = Platform.create(platform_params)
    redirect_to( platform_path( platform.id ) )
  end

  def destroy
    platform = find_platform
    platform.destroy
    redirect_to(platforms_path)
  end

  def edit
    @platform = find_platform
  end

  def update
    platform = find_platform
    platform.update(platform_params)
    redirect_to(platform_path(platform.id))
  end

  private

  def find_platform
    Platform.find(params[:id])
  end

  def platform_params
    params.require(:platform).permit(:name, :owner, :released)
  end

end