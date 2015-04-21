# post_comments POST   /posts/:post_id/comments(.:format) comments#create
# vote_post POST   /posts/:id/vote(.:format)                   posts#vote
# vote_post_comment POST   /posts/:post_id/comments/:id/vote(.:format) comments#vote
class CommentsController < ApplicationController
	before_action :require_user

	def create
		@post = Post.find(params[:post_id])
		@comments = @post.comments.build(params.require(:comment).permit(:body))
		@comments.user = User.find(session[:user_id])

		if @comments.save  
			flash[:notice] = "Your comment was added"
			redirect_to post_path(@post)
		else
			render 'post/show'
		end

	end

	def vote
		
		comment = Comment.find(params[:id])
		vote = Vote.create(voteable: comment, user_id: current_user.id, vote: params[:vote])

		if vote.valid?
			flash[:notice] = "Your vote has been counted "
		else
			flash[:error] = "You can only vote once"
		end
		redirect_to :back
	end
end
