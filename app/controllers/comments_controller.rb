class CommentsController < ApplicationController
  before_action :set_task

  def create
    @task.comments.create!(comment_params)
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
