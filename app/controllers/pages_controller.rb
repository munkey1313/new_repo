class PagesController < ApplicationController
	def home
		if member_signed_in? 
			redirect_to '/dashboard/'
		end
  	end
  	# This is the controller method that feeds data to use on the dashboard
  	def dashboard
  		@leagues = League.all
      @current_member = current_member
  		@members = current_member.followers
  	end
end
