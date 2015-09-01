class ApplicationController < ActionController::Base
	
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  include CanCan::ControllerAdditions

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    # permits authentication keys (email) plus password and password_confirmation
    devise_parameter_sanitizer.for(:account_update) << :name
    # permits authentication keys (email) plus password, password_confirmation and current_password
  end
end
