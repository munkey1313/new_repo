class PagesController < ApplicationController
	def home
		if member_signed_in? 
			redirect_to '/dashboard/'
		end
  	end

  	def dashboard
  		
  	end
end
