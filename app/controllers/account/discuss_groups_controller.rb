class Account::DiscussGroupsController < ApplicationController
	def index
		@my_discuss_groups = current_user.participated_discuss_groups
	end
end
