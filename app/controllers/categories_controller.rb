#  categories GET    /categories(.:format)          categories#index
#               POST   /categories(.:format)          categories#create
#  new_category GET    /categories/new(.:format)      categories#new
# edit_category GET    /categories/:id/edit(.:format) categories#edit
#      category GET    /categories/:id(.:format)      categories#show
#               PATCH  /categories/:id(.:format)      categories#update
#               PUT    /categories/:id(.:format)      categories#update
#               DELETE /categories/:id(.:format)      categories#destroy


class CategoriesController < ApplicationController
	before_action :require_user, only: [:new, :create]
	def index
		@categories = Category.all
	end

	def show
		@categories = Category.find(params[:id])
	end

	def new
		@categories = Category.new
	end

	def create
		@categories = Category.new(categories_params)
		if @categories.save
			flash[:notice] = "Your category has been submited"
			redirect_to categories_path
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
	end

	private
	def categories_params
		params.require(:category).permit(:name)
	end
end