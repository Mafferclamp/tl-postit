     # register GET    /register(.:format)                users#new
     #    users POST   /users(.:format)                   users#create
     #     user GET    /users/:id(.:format)               users#show

class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
	before_action :require_same_user, only: [:edit, :update]
	def index
	end

	def show
		@post = Post.where(user_id: @user.id)
		@comments = Comment.where(user_id: @user.id)
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

	def set_user
		@user = User.find(params[:id])
	end

	def require_same_user
		if current_user != @user 
			flash[:error] = "You don't have permission to do that"
			redirect_to root_path
		end
	end
end