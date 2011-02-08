class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @title = @user.first_name + @user.last_name
  end

  def new
    @title = "Sign up"
  end

end
