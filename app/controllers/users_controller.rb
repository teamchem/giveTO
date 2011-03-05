class UsersController < ApplicationController
  def index
    @users = User.paginate(:page => params[:page])
  end
  
  def show

    @user = User.find(params[:id])
    @title = "#{@user.first_name} #{@user.last_name}"
    @events = @user.volunteers
  end

  def new
    @title = "Sign up"
  end

  def create
    @user = User.new(params[:user])
    
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to giveTO!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
end
