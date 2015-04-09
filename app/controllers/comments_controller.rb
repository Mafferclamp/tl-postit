# post_comments POST   /posts/:post_id/comments(.:format) comments#create

class CommentsController < ApplicationController
	before_action :require_user

	def create
		@post = Post.find(params[:post_id])
		@comments = @post.comments.build(params.require(:comment).permit(:body))
		@comments.user = User.first

		if @comments.save  
			flash[:notice] = "Your comment was added"
			redirect_to post_path(@post)
		else
			render 'post/show'
		end

	end
end
