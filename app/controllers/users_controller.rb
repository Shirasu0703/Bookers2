class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update]


  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

  def new
     @user = User.new
      flash[:notice] = "successfully"
  end


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit

    @user = User.find(params[:id])
  end

  def index
    @users = User.page(params[:page])
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def update
    @user = current_user
   if @user.update(user_params)
    flash[:notice] = "successfully"
    redirect_to user_path(current_user)
   else
    flash.now[:alert] = "error"
    render :edit, status: :unprocessable_entity
  end
end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end




end
