class LogosController < ApplicationController
  include PurgeableImages

  private

  def image_symbol
    :logo
  end

  def resource_class
    Account
  end

  def resource_id_param
    :account_id
  end

  def redirect_path
    edit_account_path(account)
  end
end
