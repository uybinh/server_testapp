class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
  end

  def edit
  end

  def update

  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_digest)
    end
end
