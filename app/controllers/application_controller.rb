class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include CanCan::ControllerAdditions

  rescue_from CanCan::AccessDenied do |exception|
    # @request.env['HTTP_REFERER'] = root_path
    redirect_to root_path, alert: "You can't access this page"
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :first_name, :last_name, :steam_id, :origin_id, :uplay_id, :xbox_user, :psn, :nnid, :profile_image, {:game_ids => []}, {:platform_ids => []}, :location) }


    # registration_params = [:username, :email, :password, :password_confirmation]

    # if params[:action] == 'update'
    #   devise_parameter_sanitizer.for(:account_update) { 
    #     |u| u.permit(registration_params << :current_password)
    #   }
    # elsif params[:action] == 'create'
    #   devise_parameter_sanitizer.for(:sign_up) { 
    #     |u| u.permit(registration_params) 
    #   }
    # end

  end

end
