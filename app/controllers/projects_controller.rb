class ProjectsController < ApplicationController

before_action :find_project, only: [:show, :edit, :destroy, :update]

def index
 @projects = Project.all
end

def new
  @project = Project.new
end

def create
 @project = Project.new(project_attributes)
  if @project.save
    redirect_to @project
  else
    render :new
  end
end

def edit
end

def update
  if @project.update_attributes(project_attributes)
    redirect_to projects_path
  else
    render @project
  end
end

def show
end

def destroy
  if @project.destroy
      redirect_to projects_path, notice: "Project deleted!"
    else
      redirect_to projects
    end
end

def project_attributes
  params.require(:project).permit([:title, :description, :due_date])
end

def find_project
  @project = Project.find params[:id]
end

end
