class GroupsController < ApplicationController

  load_and_authorize_resource

  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to root_path, alert: "You can't access this page"
  # end

  def index
    @groups = Group.all.order(:name)
  end

  def show
    @group = find_group
  end

  def new
    @group = current_user.groups.new
  end

  def create
    group = current_user.created_groups.create(group_params)
    redirect_to( group_path( group.id ) )
  end

  def destroy
    group = find_group
    group.destroy
    redirect_to(groups_path)
  end

  def edit
    @group = find_group
  end

  def update
    group = find_group
    group.update(group_params)
    redirect_to(group_path(group.id))
  end

  private

  def find_group
    Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :private, :creator_id)
  end

end