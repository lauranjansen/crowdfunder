class SessionsController < ApplicationController
	skip_before_filter :require_login, except: [:destroy]
	
	def new
		@user = User.new
	end

	def create
		if @user = login(params[:email], params[:password])
			redirect_back_or_to(:projects, notice: 'Login successful!')
		else
			flash.now[:alert] = 'Login failed :('
			render action: 'new'
		end
	end

	def destroy
		logout
		redirect_to(:projects, notice: 'Logged out!')
	end
end
