class CustomerPortal::TicketsController < ApplicationController
  before_action :authenticate_user!

  def index
    @accounts = if params[:selected_account_id].present?
      Account.where(id: params[:selected_account_id])
    else
      Account.all.order(:name)
    end
  end
end
