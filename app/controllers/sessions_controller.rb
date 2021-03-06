class SessionsController < ApplicationController

  def new
    render 'new', layout: false
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = 'You have logged in successfully'
      # redirect_to :back
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new', layout: false
    end
  end

  def destroy
    log_out
    # if logged_in?
    redirect_to root_path
  end
  
end