class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Acceso denegado."
  redirect_to root_path
end

protected

  def configure_permitted_parameters
    added_attrs = [:rut, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end


end
