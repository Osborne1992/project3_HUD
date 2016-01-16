class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected


  def configure_permitted_parameters
    registration_params = [:username, :email, :password, :password_confirmation]
    extra_fields = [:first_name, :last_name, :steam_id, :origin_id, :uplay_id, :xbox_user, :psn, :nnid]

    extra_fields.each { |field| devise_parameter_sanitizer.for(:sign_up) << field }
    extra_fields.each { |field| devise_parameter_sanitizer.for(:account_update) << field }
  end

end
