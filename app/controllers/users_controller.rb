class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @Users = User.find(params[:id])
  end
end
