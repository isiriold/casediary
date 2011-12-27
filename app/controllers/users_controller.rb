class UsersController < ApplicationController
  skip_before_filter :check_logged_in

  def index
    @users = current_user.law_firm.users
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    @user.role = params[:role]
    if @user.save
      flash[:notice] = "Registration successful."
      redirect_to clients_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to user_path(@user)
    else
      render :action => 'edit'
    end
  end

end
