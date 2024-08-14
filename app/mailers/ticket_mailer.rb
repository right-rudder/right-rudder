class TicketMailer < ApplicationMailer
  def completed_ticket
    @ticket = params[:ticket]
    @user = params[:user]
    mail(to: @user.email, subject: "Squawk Completed: #{@ticket.title}" )
  end

  def assigned_ticket
    @ticket = params[:ticket]
    @user = params[:user]
    mail(to: @user.email, subject: "Squawk Assigned: #{@ticket.title}")
  end

  def unassigned_ticket
    @ticket = params[:ticket]
    @user = params[:user]
    mail(to: @user.email, subject: "Squawk Unassigned: #{@ticket.title}")
  end
end
