class UsersController < ApplicationController
 	before_action :authenticate_user!

 	def edit
 		@user = current_user
 	end 


 	def update 
    @user = User.find(params[:id])
    if @user.update(user_params)
    	flash[:notice] = "user update successfully"
    	redirect_to root_path
    else
    	render :edit
    end
 	end

	def show
		@user = current_user

 		@posts = current_user.posts
 	end


 	private 

 	def user_params
 		params.require(:user).permit(:display_name, :image, :website_url, :facebook_url, :twitter_url, :flikker_url)
 	end
end