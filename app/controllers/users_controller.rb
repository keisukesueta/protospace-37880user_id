class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    #@nickname = user.name
    #@prototypes = user.profiles
  end
end
