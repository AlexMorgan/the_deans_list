class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    if resource.profile_complete
      user_path(resource)
    else
      flash[:notice] = "Please complete the rest of your profile information"
      edit_user_path(resource)
    end
  end
end
