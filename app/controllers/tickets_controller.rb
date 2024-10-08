class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy update_completed ]
  before_action :set_account
  load_and_authorize_resource :account
  load_and_authorize_resource :ticket, through: :account

  # GET /tickets or /tickets.json
  def index
  end

  # GET /tickets/1 or /tickets/1.json
  def show
    Notification.where(notifiable: @ticket, recipient: current_user).unread.each do |notification|
      notification.mark_as_read!
    end
  end

  # GET /tickets/new
  def new
    @ticket = @account.tickets.build(creator: current_user)
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets or /tickets.json
  def create
    @ticket = @account.tickets.build(ticket_params.merge(creator: current_user))

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to account_ticket_url(@account, @ticket), notice: "Ticket was successfully created." }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    previous_assigned_users = @ticket.assigned_users.to_a
    respond_to do |format|
      if @ticket.update(ticket_params)
        check_assigned_users_change(@ticket, previous_assigned_users)
        @ticket.create_notes(current_user)
        format.html { redirect_to account_ticket_url(@account, @ticket), notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_completed
    @ticket.update(completed_ticket_params)
    @ticket.create_notes(current_user)
    if params[:ticket][:source] == "account_index"
      redirect_to account_tickets_url(@account, selected_user_id: params[:ticket][:selected_user_id])
    else
      redirect_to tickets_url(selected_account_id: params[:ticket][:selected_account_id], selected_user_id: params[:ticket][:selected_user_id])
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to account_tickets_url(@account), notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def set_account
      @account = Account.findr(params[:account_id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:title, :content, :due_date, :account_id, :completed, :repeat_until, :repeat, assigned_user_ids: [], notified_user_ids: [])
    end

    def completed_ticket_params
      params.require(:ticket).permit(:completed)
    end

    def check_assigned_users_change(ticket, previous_assigned_users)
      new_assigned_users = ticket.assigned_users.to_a
      removed_users = previous_assigned_users - new_assigned_users
      added_users = new_assigned_users - previous_assigned_users
      
      removed_users.each do |user|
        TicketMailer.with(ticket: ticket, user: user, actor: current_user).unassigned_ticket.deliver_later(wait: 5.seconds) unless user == current_user
      end

      added_users.each do |user|
        TicketMailer.with(ticket: ticket, user: user, actor: current_user).assigned_ticket.deliver_later(wait: 5.seconds) unless user == current_user
      end
    end
end
