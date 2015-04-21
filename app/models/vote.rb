class Vote < ActiveRecord::Base
	belongs_to :user, class_name: 'User', foreign_key: 'user_id'
	belongs_to :comments, foreign_key: :id
	belongs_to :voteable, polymorphic: true

	#validates_uniqueness_of :user, scope: [:voteable, :voteable_type]
end