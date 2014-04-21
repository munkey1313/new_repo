class RegistrationsController < Devise::RegistrationsController

  # Overrides the devise registration controller.
  # We override the update action to allow users to update all information except their email and password 
  # without their current password.

  def update
    @member = Member.find(current_member.id)
    successfully_updated = if needs_password?(@member, params)
      @member.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
    else
      # remove the virtual current_password attribute
      # update_without_password doesn't know how to ignore it
      params[:member].delete(:current_password)
      @member.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @member, :bypass => true
      redirect_to after_update_path_for(@member)
    else
      render "edit"
    end
  end

  private

  # check if we need password to update user data
  # ie if password was changed
  def needs_password?(user, params)
    user.email != params[:member][:email] ||
      params[:member][:password].present?
  end
end