class UsersController < ApplicationController

  load_and_authorize_resource

  def index
    # @users = User.all.sort { |a, b| [a.first_name, a.last_name, a.username] <=> [b.first_name, b.last_name, b.username] }
    @users = User.order('users.first_name, users.last_name, users.username')

    # @users = (current_user.blank? ? User.all : User.find(:all, :conditions => ["id != ?", current_user.id]))
  end

end