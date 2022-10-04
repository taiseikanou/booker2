class BooksController < ApplicationController


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if@book.save
    redirect_to book_path(@book.id)
    flash[:hoge] = "You have created book successfully."
    else
    @user = current_user
    @books = Book.all
    render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_comment = BookComment.new
  end



  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
    redirect_to book_path(@book.id)
   flash[:success]= "You have updated book successfully."
   else
    render :edit
   end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user

  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title , :body ,:user_id)
  end
end
