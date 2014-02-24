class UsersController < ApplicationController
  def member_params
    params.require(:member).permit(:image)
  end
end