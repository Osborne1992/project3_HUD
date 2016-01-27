class HomeController < ApplicationController

  def index
    @reviews = Review.all.order(:created_at)
    @users = User.order(:username)
  end
  
end