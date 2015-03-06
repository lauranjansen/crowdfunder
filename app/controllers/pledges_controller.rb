class PledgesController < ApplicationController
  before_filter :load_project

  def create
    @pledge = @project.pledges.build(pledge_params)
    @pledge.backer = current_user


    if @pledge.save
      redirect_to project_path(@project.id), notice: "Pledge Accepted!!"
    else
      render projects_path
    end
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end

  def pledge_params
    params.require(:pledge).permit(:reward_id)
  end

end




