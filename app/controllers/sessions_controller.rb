class SessionsController < ApplicationController
	def new
		
	end

	def create
		user = User.where(username: params[:username]).first
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:notice] = "Welcome back #{user.username}"
			redirect_to root_path
		else
			flash[:error] = "Something went wrong with your username or password"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have been logged out"
		redirect_to root_path
	end
end