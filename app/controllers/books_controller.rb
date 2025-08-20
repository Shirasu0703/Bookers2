class BooksController < ApplicationController
  def top
  end

  def new
    @book = Book.new
  end

  def create
  @book = Book.new(new_book_params)
  @book.user_id = current_user.id
  @book.save
  redirect_to book_path
  end

  def index
    @books = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_index_path
  end



  private

  def new_book_params
  params.require(:book).permit(:title, :image, :body)
  end

end
