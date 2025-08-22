class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.new
  end


  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def update
   if @user.update(user_params)
    redirect_to user_path(@user)
   else
    render :edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
end
