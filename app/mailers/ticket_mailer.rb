class TicketMailer < ApplicationMailer
  def completed_ticket
    @ticket = params[:ticket]
    @user = params[:user]
    mail(to: @user.email, subject: "Squawk Completed")
  end
end
