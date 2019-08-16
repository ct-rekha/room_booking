class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to rooms_path, notice: "Your have succesfully logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      redirect_to root_url
    end
  end

  def destroy
  	session[:user_id] = nil
    redirect_to root_url, notice: "Your have succesfully logged out!"
  end

end
