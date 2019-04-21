class PostsController < ApplicationController
	layout 'form_layout'

	def index
		
	end


	def new
		@post = Post.new
	end

	def create

		@post  = Post.new(post_params)
		
			@post.user_id  = current_user.id
	
		if  @post.save
			flash[:notice]= "post was successfully created"
			redirect_to  post_path(@post)
		else
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
		
	end

	def edit
    @post = Post.find(params[:id])
	end

	def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
     	flash[:notice] = "post successfully updated"
     	redirect_to post_path(@post)
    else
     	render :edit
    end
	end
		
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		flash[:notice]= "post is successfully deleted"
		redirect_to  posts_path
	end

	def upvote
		@post = Post.find(params[:id])
		vote = Vote.find_or_create_by(user_id: current_user.id, post_id: params[:id])
		vote.vote_type = 'upvote'
		vote.save
		# redirect_to root_path
	end

	def downvote
		@post = Post.find(params[:id])
		vote = Vote.find_or_create_by(user_id: current_user.id, post_id: params[:id])
		vote.vote_type = 'downvote'
		vote.save
		# redirect_to root_path
	end
   
   def create_comment
		post = Post.find(params[:id])
		comment = post.comments.build(params.require(:comment).permit(:content, :image))
		comment.user_id = current_user.id
		comment.save

		redirect_back fallback_location: root_path
	end

	private

	def post_params
		params.require(:post).permit(:name, :description, :category_id, :user_id, :image)
	end
end 