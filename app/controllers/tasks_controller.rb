class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # params returns a hash of parameters
    @task = Task.find(params[:id])
  end

  def new
    # using this to generate form (what vars to get input for), then passing that to "create" meth below
    @task = Task.new
  end

  def create
    task = Task.create(task_params)
    redirect_to task_path(task)
  end

  def edit
    find_task
  end

  def update
    find_task
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    find_task
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    return params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
