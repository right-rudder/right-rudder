class TicketSubscriptionsController < ApplicationController
  before_action :set_account
  before_action :set_ticket
  before_action :set_ticket_subscription, only: :destroy

  def create
    ticket_subscription = TicketSubscription.new(user: current_user, ticket: @ticket)
    ticket_subscription.save
    redirect_to account_ticket_url(@account, @ticket), notice: "You have successfully subscribed to this squawk."
  end

  def destroy
    @ticket_subscription.destroy
    redirect_to account_ticket_url(@account, @ticket), notice: "You have successfully unsubscribed from this squawk."
  end

  private

  def set_account
    @account = Account.find(params[:account_id])
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def set_ticket_subscription
    @ticket_subscription = TicketSubscription.find(params[:id])
  end
end
