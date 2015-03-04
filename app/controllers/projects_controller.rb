class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.owner = current_user
    if @project.save
      redirect_to projects_path
    else
      render :new, alert: 'Project could not be created.'
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    #put ensured login here#
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, notice: 'Project was deleted.'
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :funding_goal, :start_date, :end_date)
  end

end
