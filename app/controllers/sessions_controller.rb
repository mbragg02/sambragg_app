class SessionsController < ApplicationController
  def new
  end

  def create
    session[:admin_login_password] = params[:admin_login_password]
    unless admin?
      redirect_to(login_path, :alert => 'unauthorized access')
    else
    redirect_to(root_path, :notice => 'Successfully logged in')
  end
  end

  def destroy
    reset_session
    redirect_to(root_path, :notice => 'Successfully logged out')
  end

end
