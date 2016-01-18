class UsersController < ApplicationController

  def index
    # @users = User.all.sort { |a, b| [a.first_name, a.last_name, a.username] <=> [b.first_name, b.last_name, b.username] }
    @users = User.order('users.first_name, users.last_name, users.username')
  end

end