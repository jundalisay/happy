class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper  # protect_from_forgery with: :null_session

  $logo = "http://res.cloudinary.com/dzq6ujhgq/image/upload/v1513407040/hc_vggp8v.png"

  def authenticate_user! 
    redirect_to login_path unless current_user 
  end 

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
end