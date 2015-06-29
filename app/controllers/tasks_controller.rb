class TasksController < ApplicationController
  before_filter :find_list, :find_user

  def index
    @tasks = @list.try(:tasks) || []
  end

  def new
    @task = @list.tasks.new
  end

  def create
    @task = @list.tasks.new task_params

    if @task.save
      redirect_to user_list_tasks_path(@user, @list), notice: 'Congratulation! You have added a new Task.'
    else
      render 'new'
    end
  end

  private

  def find_list
    @list = List.where(id: params[:list_id]).last
  end

  def find_user
    @user = current_user
  end


  def task_params
    params.require(:task).permit(:name, :description)
  end

end
