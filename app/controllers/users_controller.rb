class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user["first_name"] = params["user"]["first_name"]
    @user["last_name"] = params["user"]["last_name"]
    @user["email"] = params["user"]["email"]
    @user["password"] = BCrypt::Password.create(params["user"]["password"])
    if User.find_by({"email" => params["user"]["email"]}) != nil
      flash["notice"] = "Please use existing log-in."
      redirect_to "/sessions/new"
    else
      @user.save
      redirect_to "/posts"
    end 
  end
end
