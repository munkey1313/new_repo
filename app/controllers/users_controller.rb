class UsersController < ApplicationController
  def member_params
    params.require(:member).permit(:image)
  end

  def index
<<<<<<< HEAD
  		@members = Member.all
=======
  	@members = Member.all
  end
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @member }
    end
>>>>>>> dd1cb583bfffd5a25daa3938e4d570636e9c5327
  end

end