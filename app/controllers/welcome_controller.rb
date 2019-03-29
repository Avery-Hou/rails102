class WelcomeController < ApplicationController
	def index
		flash.notice = "good morning!!"
		flash.alert = "good afternoon!!"
		flash[:warning] = "good night!!"
	end
end
