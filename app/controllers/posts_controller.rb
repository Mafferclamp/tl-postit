#Routes 
# post_comments POST   /posts/:post_id/comments(.:format)     comments#create
#  post_comment GET    /posts/:post_id/comments/:id(.:format) comments#show
#         posts GET    /posts(.:format)                       posts#index
#               POST   /posts(.:format)                       posts#create
#      new_post GET    /posts/new(.:format)                   posts#new
#     edit_post GET    /posts/:id/edit(.:format)              posts#edit
#          post GET    /posts/:id(.:format)                   posts#show
#               PATCH  /posts/:id(.:format)                   posts#update
#               PUT    /posts/:id(.:format)                   posts#update

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
  	@posts = Post.all
  end

  def show
    @comments = Comment.new
  end

  def new
  	@post = Post.new
    @categories = Category.all
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

  def edit; end

  def update
    if @post.update(post_params)
      flash[:notice] = '"'+"#{@post.title}"+'"'+" was updated"
      redirect_to posts_path
    else 
      render :edit
    end 
  end 

  private 

  def post_params
  	params.require(:post).permit! #(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
