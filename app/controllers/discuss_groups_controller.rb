class DiscussGroupsController < ApplicationController
	def index
		@discuss_groups = DiscussGroup.all
	end

	def new
		@discuss_group = DiscussGroup.new
	end
end
