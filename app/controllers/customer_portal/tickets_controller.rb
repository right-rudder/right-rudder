class CustomerPortal::TicketsController < ApplicationController
  before_action :authenticate_user!

  def index
    @accounts = if params[:account_id].present?
      Account.where(id: params[:account_id])
    else
      Account.all
    end
  end
end
