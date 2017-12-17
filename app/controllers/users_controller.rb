class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]


  def index
    if params[:q]
      @users = User.search(params[:q])
      if params[:q].blank?
        @users = User.all
      else
      end
    else
      @users = User.all
    end
  end

  def show
    @listenings = Listening.where("user_id = ?", @user.id)
  end


  def new
    @user = User.new
    render 'new', layout: false
  end

  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
      if @user.save
        log_in @user
        flash[:success] = 'Account was successfully created.'
        redirect_to root_path
      else
        render :new
      end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Account was successfully updated.'
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = 'Account was successfully destroyed.'
      redirect_to root_path
    end
  end


  private
  
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :username,
        :email, :password, :password_confirmation, 
        :first_name, :last_name, :photo, :artist1, :artist2, :artist3, :genre1, :genre2, :genre3)
    end


    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end