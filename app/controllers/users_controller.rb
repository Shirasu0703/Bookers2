class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
     @user = User.new
      flash[:notice] = "successfully"
  end


  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
    
  end

  def edit
    @user = current_user
  end

  def index
    @users = User.page(params[:page])
  end

  def update
    @user = current_user
   if @user.update(user_params)
    flash[:notice] = "successfully"
    redirect_to my_books_path
   else
    flash.now[:alert] = "error"
    render :edit
  end
end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
