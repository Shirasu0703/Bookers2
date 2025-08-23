class BooksController < ApplicationController
  def top
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book was successfully updated."
    else
      render:edit
    end
  end


  def create
    @book = current_user.books.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "Book was successfully created."
    else
      flash.now[:alert] = "error"
      render :new
    end
  end

  def index
    @book = Book.new
    @books = Book.page(params[:page])
  end

  def my_books
    @books = @user.books.page(params[:page])
    @book = Book.new
    @user = User.find(params[:user_id])
   end



  def show
    @book = Book.find(params[:id])
    @books = [@book]
    @show_page = true
  end

  def destroy
    book = Book.find(params[:id])
   if book.destroy
    flash[:notice] = "successfully"
    redirect_to my_books_path
   end

  end



  private

  def new_book_params
  params.require(:book).permit(:title, :image, :body)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
