class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create] if Rails.env.production? # Change this to be any actions you want to protect.

  private

  def after_sign_in_path_for(resource)
    if resource.account_users.any?
      account_path(resource.account_users.first.account)
    else
      super
    end
  end

  def after_update_path_for(resource)
    if resource.account_users.any?
      account_path(resource.account_users.first.account)
    else
      customer_portal_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def check_captcha
    return if verify_recaptcha # verify_recaptcha(action: 'login') for v3

    self.resource = resource_class.new sign_up_params

    respond_with_navigational(resource) do
      flash.discard(:recaptcha_error) # We need to discard flash to avoid showing it on the next page reload
      render :new
    end
  end
end
