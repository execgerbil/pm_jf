class TasksController < ApplicationController

before_action :find_task, only: [:show, :edit, :destroy, :update]

def index
 @tasks = Task.all
end

def new
  @task = Task.new
end

def create
 @task = Task.new(task_attributes)
  if @task.save
    redirect_to @task
  else
    render :new
  end
end

def edit
end

def update
  if @task.update_attributes(task_attributes)
    redirect_to tasks_path
  else
    render @task
  end
end

def show
end

def destroy
  if @task.destroy
      redirect_to tasks_path, notice: "Task deleted!"
    else
      redirect_to tasks
    end
end

def task_attributes
  params.require(:task).permit([:title, :due_date])
end

def find_task
  @task = Task.find params[:id]
end

end

