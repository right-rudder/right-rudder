class RegistrationsController < Devise::RegistrationsController
  protected

  def after_update_path_for(resource)
    customer_portal_path
  end
end
