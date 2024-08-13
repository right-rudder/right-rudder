class TicketMailer < ApplicationMailer
  def completed_ticket
    @ticket = params[:ticket]
    @user = params[:user]
    mail(to: @user.email, subject: "Squawk Completed")
  end

  def assigned_ticket
    @ticket = params[:ticket]
    @user = params[:user]
    mail(to: @user.email, subject: "Squawk Assigned")
  end

  def unassigned_ticket
    @ticket = params[:ticket]
    @user = params[:user]
    mail(to: @user.email, subject: "Squawk Unassigned")
  end
end
