class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    if @book.save
      redirect_to @book
    else
      render :index
    end
  end
  
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
  end
  
  def destroy
  end
  
  private
  
  def book_params
    params.permit(:title, :body)
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
