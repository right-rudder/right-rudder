class CommentMailer < ApplicationMailer
  def new_comment
    @comment = params[:comment]
    @user = params[:user]
    @actor = params[:actor]
    mail(to: @user.email, subject: "New Comment on #{@comment.ticket.title}")
  end

  def mentioned
    @comment = params[:comment]
    @user = params[:user]
    @actor = params[:actor]
    mail(to: @user.email, subject: "#{@actor.first_name} mentioned in a comment")
  end
end
