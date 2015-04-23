class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote]
	before_action :authenticate_user!, except: [:index, :show]

	def search
		if params[:search]
			@posts = Post.search(params[:search])
		else
			@posts = Post.all.order("RANDOM()")
		end
	end

	def index
		if params[:tag]
			@posts = Post.tagged_with(params[:tag]).all.order("RANDOM()")
		else
			@posts = Post.all.order("RANDOM()")
		end
	end

	def show
		@comments = Comment.where(post_id: @post)
		@posts_story = Post.tagged_with(@post.tag_list_fixed).all.where(is_sale: false)
		@posts_sale = Post.tagged_with(@post.tag_list_fixed).all.where(is_sale: true)
		render layout: 'fancybox'
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to @post, notice: "성공적으로 포스트가 작성되었습니다."
			# render layout: 'fancybox'
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
		if @post.user_id != current_user.id
			redirect_to :back, notice: "수정 권한이 없습니다."
		end
	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: "포스트가 정상적으로 수정되었습니다."
		else
			render 'edit'
		end
	end

	def destroy
		if @post.user_id == current_user.id
			@post.destroy
			redirect_to root_path, notice: "포스트가 성공적으로 삭제되었습니다."
		else
			redirect_to :back, notice: "삭제 권한이 없습니다."
		end
	end

	def upvote
		@post.upvote_by current_user
		redirect_to :back
	end

	private

	def post_params
		params.require(:post).permit(:title, :description, :image, :tag_list_fixed, :is_sale, :price)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
