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
    mail(to: @user.email, subject: "#{@actor.first_name} mentioned you in a comment.")
  end

  def completed
    @comment = params[:comment]
    @user = params[:user]
    @actor = params[:actor]
    mail(to: @user.email, subject: "Completed: #{@comment.ticket.title}")
  end

  def reopened
    @comment = params[:comment]
    @user = params[:user]
    @actor = params[:actor]
    mail(to: @user.email, subject: "Reopened: #{@comment.ticket.title}")
  end

  def date_change
    @comment = params[:comment]
    @user = params[:user]
    @actor = params[:actor]
    mail(to: @user.email, subject: "Date change: #{@comment.ticket.title}")
  end
end
