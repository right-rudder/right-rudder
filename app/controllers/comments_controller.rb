class CommentsController < ApplicationController
  before_action :set_ticket

  def new
    @account = @ticket.account
    @comment = @ticket.comments.build(user: current_user)
  end

  def create
    @ticket.comments.create!(comment_params.merge(user: current_user))
    redirect_to account_ticket_path(@ticket.account, @ticket)
  end

  def destroy
    @ticket.comments.find(params[:id]).destroy
    redirect_to account_ticket_path(@ticket.account, @ticket)
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
