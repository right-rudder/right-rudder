class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :set_account

  # GET /tasks or /tasks.json
  def index
    @overdue_tasks = @account.tasks.overdue
    @due_today_tasks = @account.tasks.due_today
    @due_tomorrow_tasks = @account.tasks.due_tomorrow
    @due_later_this_week_tasks = @account.tasks.due_later_this_week
    @due_next_week_tasks = @account.tasks.due_next_week
    @due_later_tasks = @account.tasks.due_later
    @completed_tasks = @account.tasks.completed.first(5)
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = @account.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = @account.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to account_task_url(@account, @task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        redirect_path = params[:task_id] ? account_task_url(@account, @task) : account_tasks_url(@account)
        format.html { redirect_to redirect_path, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to account_tasks_url(@account), notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_account
      @account = Account.find(params[:account_id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :due_date, :account_id, :completed)
    end
end
