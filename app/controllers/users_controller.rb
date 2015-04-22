class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@posts = @user.posts.all.order("created_at DESC")
		render layout: 'fancybox'
	end
end
