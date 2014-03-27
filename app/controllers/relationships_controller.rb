class RelationshipsController < ApplicationController
  # before_action :signed_in_user

  def create
    @member = Member.find(params[:relationship][:followed_id])
    current_member.follow!(@member)
    redirect_to members_path(@member.name)
    FriendMailer.friend_mailer(@member).deliver
  end

  def destroy
    @member = Relationship.find(params[:id]).followed
    current_member.unfollow!(@member)
    redirect_to members_path(@member.name)
  end
end