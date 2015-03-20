class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end
  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user = User.first # TODO: Change once we have authentication is created 

  	if  @post.save
  		flash[:notice] = "Your post was created."
  		redirect_to posts_path
  	else
  		render 'new'
  	end
  end

  def edit
  
  end

  def update
  
  end 

  private 

  def post_params
  	params.require(:post).permit(:title, :url, :description)
  end

end
