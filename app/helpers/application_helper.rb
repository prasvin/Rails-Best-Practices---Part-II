module ApplicationHelper

  def current_user
    current_user_session && current_user_session.record
  end

  def logged_in?
    current_user
  end

end
