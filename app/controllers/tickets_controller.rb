class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]
  before_action :set_account

  # GET /tickets or /tickets.json
  def index
    @overdue_tickets = @account.tickets.overdue
    @due_today_tickets = @account.tickets.due_today
    @due_tomorrow_tickets = @account.tickets.due_tomorrow
    @due_later_this_week_tickets = @account.tickets.due_later_this_week
    @due_next_week_tickets = @account.tickets.due_next_week
    @due_later_tickets = @account.tickets.due_later
    @completed_tickets = @account.tickets.completed.first(5)
  end

  # GET /tickets/1 or /tickets/1.json
  def show
    Notification.where(notifiable: @ticket, recipient: current_user).unread.each do |notification|
      notification.mark_as_read!
    end
  end

  # GET /tickets/new
  def new
    @ticket = @account.tickets.build(user: current_user)
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets or /tickets.json
  def create
    @ticket = @account.tickets.build(ticket_params.merge(user: current_user))

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
    respond_to do |format|
      if @ticket.update(ticket_params)
        # binding.pry
        case params[:ticket][:source]
        when "account_index"
          redirect_path = account_tickets_url(@account)
        when "portal_index"
          if params[:ticket][:filter] == "my-tickets"
            redirect_path = tickets_url(filter: "my-tickets")
          else
            redirect_path = tickets_url
          end
        else
          redirect_path = account_ticket_url(@account, @ticket)
        end
        # redirect_path = params[:ticket][:source] ? account_tickets_url(@account) : account_ticket_url(@account, @ticket)
        format.html { redirect_to redirect_path, notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
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
      @account = Account.find(params[:account_id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:title, :content, :due_date, :account_id, :completed, assigned_user_ids: [], notified_user_ids: [])
    end
end
