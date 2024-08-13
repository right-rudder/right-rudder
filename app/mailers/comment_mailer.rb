class CommentMailer < ApplicationMailer
  def new_comment
    @comment = params[:comment]
    @user = params[:user]
    @actor = params[:actor]
    mail(to: @user.email, subject: "New Comment on #{@comment.ticket.title}")
  end
end
