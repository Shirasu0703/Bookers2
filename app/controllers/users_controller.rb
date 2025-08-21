class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @book.books
  end

  def edit
  end

end
