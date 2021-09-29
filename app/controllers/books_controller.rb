class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)

  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user

  end
  def edit
   @book = Book.find(params[:id])
  end
  def update
   @book = Book.find(params[:id])
  if @book.update(book_params)
   redirect_to book_path(@book.id)
  else
   render :edit
  end

  end

  def destroy

  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
