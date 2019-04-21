class HomeController < ApplicationController
	def index
		@posts = Post.search(params[:q]).paginate(page: params[:page], per_page: 5)
	end

	def art
		category = Category.where(title: 'Art').last
		@posts = category.posts.search(params[:q]).paginate(page: params[:page], per_page: 5)
		render 'index'
	end
	def photography
		category = Category.where(title: 'photography').last

		@posts = category.posts.search(params[:q]).paginate(page: params[:page], per_page: 5)
		render 'index'
	end

	def animals
		category = Category.where(title: 'animals').last
		
		@posts = category.posts.search(params[:q]).paginate(page: params[:page], per_page: 5)
		render 'index'
	end

	def travel
		category =Category.where(title: 'travel').last
		@posts = category.posts.search(params[:q]).paginate(page: params[:page], per_page: 5)
		render 'index'
	end
end