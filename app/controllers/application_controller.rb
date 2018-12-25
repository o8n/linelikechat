class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  #before_action :configure_permitted_parameters, if: :devise_controlller?
  before_action :authenticate_user!, :detect_browser

  def after_signed_in_path_for(resource)
    rooms_show_path
  end

  private
  def signed_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end

  def detect_browser
    case request.user_agent
    when /iPhone/i
      request.varient = :smart
    end
  end

  #protected
    #def configure_permitted_parameters
     # devise_parameter_santizer.permit(:sign_up, keys: [:username])
      #devise_parameter_santizer.permit(:account_update, keys: [:username])
    #end
end
