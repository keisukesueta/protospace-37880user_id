class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :position, :occupation])
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:profile])
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:position])
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:occupation])
  end
end
