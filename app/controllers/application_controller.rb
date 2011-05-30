class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  private

  def current_user_session
    UserSession.find
  end

  def login_required
    redirect_to root_path, :notice => "You must be logged in to do that." unless logged_in?
  end

end

