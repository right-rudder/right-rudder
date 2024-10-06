class CustomerPortal::TicketsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :account

  def index
    @accounts = if params[:selected_account_id].present?
      Account.where(id: params[:selected_account_id]).includes(:account_manager, :lead_developer)
    else
      Account.all.order(:name).includes(:account_manager, :lead_developer)
    end
  end
end
