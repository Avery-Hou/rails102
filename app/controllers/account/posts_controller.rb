class Account::PostsController < ApplicationController
	def index
		@my_posts = current_user.posts
	end
end
