class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    if @book.save
      redirect_to @book, notice: "You have created book successfully."
    else
      render action: :index
    end
  end
  
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @books = Book.all
  end
  
  def edit
  	@book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
     params.require(:book).permit(:title, :body)
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
