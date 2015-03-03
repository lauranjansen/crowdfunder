class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to #
		else
			render #
		end
	end

	def show

	end

	private
	def users_params
		#change for sorcery
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
