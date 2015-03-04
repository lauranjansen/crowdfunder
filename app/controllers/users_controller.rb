class UsersController < ApplicationController
	skip_before_filter :require_login, only: [:new, :create]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to projects_url, notice: "Sweet! Welcome!"
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
		@owned_projects = Project.where("owner_id = ?", current_user.id)
		@backed_projects = Pledge.where("backer_id = ?", current_user.id)
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
