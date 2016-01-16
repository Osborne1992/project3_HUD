class UsersController < ApplicationController

  def index
    @users = User.all.sort { |a, b| [b.try(:first_name), b.try(:last_name), a.username] <=> [a.try(:first_name), a.try(:last_name), b.username] }
  end

end