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
      render :edit
    
    end
  end


  def create
    @book = current_user.books.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "Book was successfully created."
    else
      flash[:alert] = @book.errors.full_messages.join(", ")
      redirect_to books_path
    end
  end

  def index
    @book = Book.new
    @books = Book.all.includes(:user).order(created_at: :desc)
    @user = current_user
  end

  def my_books
    @display_user = current_user
    @book = Book.new
    @books =current_user.books
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

  def correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      flash[:alert] = "You are not authorized to perform this action"
      redirect_to my_books_path
    end
  end

  def new_book_params
  params.require(:book).permit(:title, :image, :body)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
