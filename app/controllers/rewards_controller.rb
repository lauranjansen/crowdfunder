class RewardsController < ApplicationController
  before_filter :load_project
  def show
    @reward = Reward.find(params[:id])
  end

  def create
    @reward = @project.rewards.build(reward_params)
    @reward.user = current_user

    if @reward.save
      redirect_to projects_path, notice: 'Review created successfully'
    else
      render new_project_path
    end
  end

  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy
  end

  private
  def reward_params
    params.require(:reward).permit(:title,:description,:amount,:_destroy)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end


end
