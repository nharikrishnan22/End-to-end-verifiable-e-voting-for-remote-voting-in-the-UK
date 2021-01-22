# Code from https://medium.com/@wintermeyer/authentication-from-scratch-with-rails-5-2-92d8676f6836
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/votes/new'
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end
  
end
