class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

	has_many :votes, as: :voteable 

	validates :body, presence: true
	def vote_total
		upvotes - downvotes
	end

	def upvotes
		self.votes.where(vote: true).size
	end

	def downvotes
		self.votes.where(vote: false).size
	end
end

