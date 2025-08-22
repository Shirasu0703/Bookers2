class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    if @user = User.new
      flash[:nitice] = "successfully"
    else
      flash.now[:alert] = "error"
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
    flash[:notice] = "successfully"
    redirect_to user_path(@user)
   else
    flash.now[:alert] = "error"
    render :edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
end
end
