class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@posts_story = @user.posts.all.where(is_sale: false).order("created_at DESC")
		@posts_sale = @user.posts.all.where(is_sale: true).order("created_at DESC")
	end
end
