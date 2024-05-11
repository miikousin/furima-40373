class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :show]
  before_action :configure_parmitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource_or_scope)
    root_path 
  end

  private
  def configure_parmitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_kana, :last_kana, :birth_day])
  end
end

