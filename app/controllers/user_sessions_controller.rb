class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html
      format.xml
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to root_path, :notice => "You are now logged in as #{@user_session.user.login}"
    end
  end
end

