class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:info] = 'Registrations are not open yet, but please check back soon'
    redirect_to root_path
  end

  def create
    flash[:info] = 'Registrations are not open yet, but please check back soon'
    redirect_to root_path
  end

  def update
    @user = User.find(current_user.id)
    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
    else
      # remove the virtual current_password attribute
      # update_without_password doesn't know how to ignore it
      params[:user].delete(:current_password)
      @user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case their password changed
      sign_in @user, bypass: true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

  def after_update_path_for(resource)
    girls_path
  end

  private
  def needs_password?(user, params)
    user.email != params[:user][:email] ||
      params[:user][:password].present?
  end
end
