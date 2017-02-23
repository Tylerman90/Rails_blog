class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		User.find(params[:id]).destroy

		redirect_to "/users"
	end

	def new
	end

	def create
		user = User.new
		user_params = params[:user]

		user.first_name = user_params[:first_name]
		user.email = user_params[:email]
		user.password = user_params[:password]

		user.save

		redirect_to root_path
	end
end
