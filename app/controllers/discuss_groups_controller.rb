class DiscussGroupsController < ApplicationController
	def index
		@discuss_groups = DiscussGroup.all
	end

	def new
		@discuss_group = DiscussGroup.new
	end


	def create
		@discuss_group = DiscussGroup.new(discuss_group_params)
		@discuss_group.save
		redirect_to discuss_groups_path
	end

	def edit
		@discuss_group = DiscussGroup.find(params[:id])
	end

	

	def show
		@discuss_group = DiscussGroup.find(params[:id])
	end


	private 

	def discuss_group_params
		params.require(:discuss_group).permit(:title, :description)
	end
end
