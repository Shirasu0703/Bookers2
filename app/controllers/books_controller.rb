class BooksController < ApplicationController
  def top
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(new_book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to books_path
    else
      flash.now[:alert] = "error"
      render :new
    end
  end

  def index
    @book = Book.new
    @books = Book.page(params[:page])
     if flash[:notice] = "successfully"
    else
      flash.now[:alert] = "error"
  end
end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
   if book.destroy
    flash[:notice] = "successfully"
    redirect_to books_path
   end
  end



  private

  def new_book_params
  params.require(:book).permit(:title, :image, :body)
  end

end
