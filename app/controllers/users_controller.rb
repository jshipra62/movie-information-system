class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :userauthorize, only: [:show, :edit, :destroy]
  before_action :adminauthorize, only: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.email.downcase!
    
    if @user.save
      session[:user_id] = @user.id.to_s
      redirect_to root_path, notice: 'Account created successfully!'
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id]) 
    if @user.update(user_params)      
      redirect_to @user
      flash[:notice] = "Account updated successfully!"
    else
      render 'edit'
    end
  end

  
  def destroy
    @user = User.find(params[:id])    
    if !current_user.nil?
      if !current_user.admin?
        @user.destroy
        session.delete(:user_id)
        redirect_to root_path
        flash[:notice] = "Account deleted successfully!"
      else
        @user.destroy
        redirect_to users_path
        flash[:notice] = "Account deleted successfully!"
      end
    end
  end

  private    
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
