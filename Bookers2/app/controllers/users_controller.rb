class UsersController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to users
  end
  
  def index
    @books = Book.all
  end
  
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end

