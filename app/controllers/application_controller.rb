class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private
  def stored_location_for(resource)
    nil
  end

  def after_sign_in_path_for(resource)
    categories_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def authenticate_admin!
    if !current_user.admin?
      redirect_to new_user_session_path
    end
  end
end
