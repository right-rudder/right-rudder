class CommentsController < ApplicationController
  before_action :set_task

  def new
    @account = @task.account
    @comment = @task.comments.build(user: current_user)
  end

  def create
    @task.comments.create!(comment_params.merge(user: current_user))
    redirect_to account_task_path(@task.account, @task)
  end

  def destroy
    @task.comments.find(params[:id]).destroy
    redirect_to account_task_path(@task.account, @task)
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
