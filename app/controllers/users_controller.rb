class UsersController < ApplicationController
  def member_params
    params.require(:member).permit(:image)
  end

  def index
  		@members = Member.all
  end

end