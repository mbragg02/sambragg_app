class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :admin?
  
  protected
  
  def authorize
    unless admin?
      flash[:notice] = " unauthorized access"
      redirect_to root_path
      false
    end
    
  end
  
  def admin?
    session[:admin_login_password] == "theend"
  end
  
end
