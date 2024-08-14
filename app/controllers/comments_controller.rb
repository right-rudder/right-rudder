class CommentsController < ApplicationController
  before_action :set_ticket
  before_action :set_account

  def new
    @comment = @ticket.comments.build(user: current_user)
  end

  def create
    @comment = @ticket.comments.create(comment_params.merge(user: current_user))
    if @comment.persisted?
      add_creator_as_subscriber(@comment)
      respond_to do |format|
        format.html { redirect_to account_ticket_path(@account, @ticket) }
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace(
              "subscribers_list",
              partial: "comments/subscribers_list",
              layout: false,
              locals: { account: @account, ticket: @ticket}
            ),
            turbo_stream.replace(
              "new_comment",
              partial: "comments/new_comment",
              layout: false,
              locals: { account: @account, ticket: @ticket}
            )
          ]
        end
      end
    else
      render :new
    end
  end

  def destroy
    @ticket.comments.find(params[:id]).destroy
    redirect_to account_ticket_path(@account, @ticket)
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def set_account
    @account = @ticket.account
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def add_creator_as_subscriber(comment)
    @ticket.subscribers << current_user unless @ticket.subscribers.include?(current_user)
  end
end
