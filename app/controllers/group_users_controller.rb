class GroupUsersController < ApplicationController

  load_and_authorize_resource

  before_action :find_group

  def new
    @group_user = @group.group_users.build
  end

  def create
    @group_user = @group.group_users.build(group_user_params)
    if @group_user.save
      redirect_to @group_user.group
    else
      render 'new'
    end
  end

  def destroy
    group_user = @group.group_users.find(params[:id])
    group_user.destroy
    redirect_to(@group)
  end

  def find_group
    @group = Group.find(params[:group_id])
  end

  def group_user_params
    params.require(:group_user).permit(:user_id)
  end

end