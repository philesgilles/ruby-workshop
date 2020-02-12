class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :added_user_params, if: :devise_controller?

  private

  def added_user_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
