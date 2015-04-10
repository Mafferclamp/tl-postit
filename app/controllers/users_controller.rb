     # register GET    /register(.:format)                users#new
     #    users POST   /users(.:format)                   users#create
     #     user GET    /users/:id(.:format)               users#show

class UsersController < ApplicationController
	def index
	end

	def show
		@post = Post.where(user_id: session[:user_id])
	end


	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		
		if @user.save
			flash[:notice] = "User has been successfully created"
			session[:user_id] = @user.id
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		
		if @user.update(user_params)
			flash[:notice] = "User has been successfully Updated"
			redirect_to root_path
		else
			render :edit
		end
	end

	private 
	
	def user_params
		params.require(:user).permit(:username, :password)
	end
end