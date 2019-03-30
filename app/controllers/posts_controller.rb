class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]
	before_action :find_discuss_group_and_post, only: [:edit, :update, :destroy]

	def new
		@post = Post.new
		@discuss_group = DiscussGroup.find(params[:discuss_group_id])
	end

	def create
		@discuss_group = DiscussGroup.find(params[:discuss_group_id])
		@post = Post.new(post_params)
		@post.discuss_group = @discuss_group
		@post.user = current_user
		if @post.save
			redirect_to discuss_group_path(@discuss_group)
		else
			render :new
		end
	end


	def edit
		
	end

	def update
		if @post.update(post_params)
			redirect_to account_posts_path
		else
			render :edit
		end 
	end

	#DELETE /discuss_groups/:discuss_group_id/posts/:id(.:format)     posts#destroy
	def destroy
		@post.destroy
		redirect_to account_posts_path
	end

	private 
	def post_params
		params.require(:post).permit(:content)
	end


	def find_discuss_group_and_post
		@discuss_group = DiscussGroup.find(params[:discuss_group_id])
		@post = Post.find(params[:id])
	end
end
