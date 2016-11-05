class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected

  def authenticated_user!
   store_origin_path
   authenticate_user!
 end

  # If any errors with login etc uncomment and delete above authenticat_user!
  #def authenticate_user!
  #  if user_signed_in?
  #    super
  #  else
  #    redirect_to login_path
  #  end
  #end

  def after_sign_up_path_for(resource)
    '/play/hub'
  end

  def after_sign_in_path_for(resource_or_scope)
     '/play/hub'
end

end
