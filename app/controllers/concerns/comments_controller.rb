class CommentsController <ApplicationRecord
	def index
		@comments = Comment.new
	end

	def show
		@comments = Comment.find(params[:post_id])
	end
	def new
		@comments = Comment.new
	end


end
