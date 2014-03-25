class UsersController < ApplicationController
  def member_params
    params.require(:member).permit(:image)
  end

  def index
  	@members = Member.all
  end
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @member }
    end
  end

  def following
    @title = "Following"
    @member = Member.find(params[:id])
    @members = @member.followed_member
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @member = Member.find(params[:id])
    @members = @member.followers
    render 'show_follow'
  end

end