class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
		@categories = Category.all
	end

	def create
		post = Post.create(params[:post])
		redirect_to post_path(post)
	end

	def edit
		@post = Post.find(params[:id])
		@categories = Category.all
	end

	def update
		post = Post.find(params[:id])
		post.update(params.require(:post).permit(:description, :post_status, :author_id, :category_id, :title))
		redirect_to post_path(post)
	end
end
