class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:current_board_member, :contact_phone_number, :first_name, :last_name, :mailing_address, :site_admin])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:current_board_member, :contact_phone_number, :first_name, :last_name, :mailing_address, :site_admin])
  end
end
