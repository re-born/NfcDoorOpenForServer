class UserController < ApplicationController

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
