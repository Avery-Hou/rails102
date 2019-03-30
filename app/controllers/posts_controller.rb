class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

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


	def post_params
		params.require(:post).permit(:content)
	end
end
