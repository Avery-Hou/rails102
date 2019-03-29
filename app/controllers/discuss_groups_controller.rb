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

	def update
		@discuss_group = DiscussGroup.find(params[:id])
		@discuss_group.update(discuss_group_params)
		redirect_to discuss_groups_path, notice: "update success"
	end

	def show
		@discuss_group = DiscussGroup.find(params[:id])
	end

	def destroy
		@discuss_group = DiscussGroup.find(params[:id])
		@discuss_group.destroy
		redirect_to discuss_groups_path, alert: "Discuss group deleted"
	end


	private 

	def discuss_group_params
		params.require(:discuss_group).permit(:title, :description)
	end
end
