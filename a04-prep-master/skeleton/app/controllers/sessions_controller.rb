class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(session[:session_token])
    if @user
      login(@user)
      redirect_to links_url
    else
      flash[:errors] = ["invalid stuff"]
      render :new
    end
  end

  def destroy
  end
end
