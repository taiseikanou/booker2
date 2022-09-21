class BooksController < ApplicationController
  def new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def show
    @book = Book.new
    @books = Book.all
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:book_name , :opinion, :image)
  end
end
