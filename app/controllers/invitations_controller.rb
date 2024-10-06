class InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:invite, keys: [:first_name, :last_name, :username])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :username])
  end
end
