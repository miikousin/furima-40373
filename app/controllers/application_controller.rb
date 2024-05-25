class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:edit]
  before_action :configure_parmitted_parameters, if: :devise_controller?

  private
  def configure_parmitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_kana, :last_kana, :birth_day])
  end
end

