class UsersController < ApplicationController
  #W hen we created our devise install, we named it member instead of user, but we are using UsersController to control the members database
  # Look at Devise documentation to know how to use devise methods for controlloing user sign ins and sign ups, etc...
  def member_params
    params.require(:member).permit(:image)
  end

  def index
  	@members = Member.all

    if params[:search]
      @members = Member.search(params[:search]).order("created_at DESC")
    else
      @members = Member.all.order('created_at DESC')
    end
    
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