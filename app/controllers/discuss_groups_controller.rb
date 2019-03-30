class DiscussGroupsController < ApplicationController
	before_action :authenticate_user!, only: [:new]

	def index
		@discuss_groups = DiscussGroup.all
	end

	def new
		@discuss_group = DiscussGroup.new
	end

	def create
		@discuss_group = DiscussGroup.new(discuss_group_params)
		if @discuss_group.save
			redirect_to discuss_groups_path, notice: "新增成功"
		else 
			render :new
		end
	end

	def edit
		@discuss_group = DiscussGroup.find(params[:id])
	end

	def update
		@discuss_group = DiscussGroup.find(params[:id])
		if @discuss_group.update(discuss_group_params)
			redirect_to discuss_groups_path, notice: "Update success"
		else
			render :edit
		end
	end

	def show
		@discuss_group = DiscussGroup.find(params[:id])
	end

	def destroy
		@discuss_group = DiscussGroup.find(params[:id])
		@discuss_group.destroy
		redirect_to discuss_groups_path, notice: "Delete success"
	end


	private 
	def discuss_group_params
		params.require(:discuss_group).permit(:title, :description)
	end
end
