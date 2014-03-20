class MemberFriendshipsController < ApplicationController
	before_filter :authenticate_member!, only: [:new]
	def new
		if params[:friend_id]
			@friend = Member.find(params[:friend_id])
			@member_friendship = current_member.member_friendships.new(friend: @friend)
		else
			flash[:error] = "Friend required"
		end

	rescue ActiveRecord::RecordNotFound
		render file: 'public/404'
	end
end
