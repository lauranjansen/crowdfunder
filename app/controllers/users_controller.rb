class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to projects_url, notice: "Sweet! Welcome!" #
		else
			render :new
		end
	end

	def show

	end

	private
	def user_params
		#change for sorcery
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
