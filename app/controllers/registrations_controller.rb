class RegistrationsController < Devise::RegistrationsController
  def update
    # For Rails 4
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)

    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @member = Member.find(current_member.id)
    if @member.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @member, :bypass => true
      redirect_to after_update_path_for(@member)
    else
      render "edit"
    end
  end
end