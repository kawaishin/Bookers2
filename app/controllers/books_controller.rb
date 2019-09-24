class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :screen_user, only: [:edit]
  def log_in
  end

  def sign_up
  end


  def index
    @books = Book.all.order(created_at: :desc)
    @user = current_user
    @book = Book.new
  end

  def show
    @post = Book.find(params[:id])
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
        redirect_to book_path(@book.id), notice: "You have updated book successfully."
      else render :edit
    end
  end

  def create
    @books = Book.all.order(created_at: :desc)
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
        redirect_to book_path(@book.id), notice: "You have created book successfully."
      else render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

  def screen_user
    book = Book.find(params[:id])
    if book.user.id != current_user.id
      redirect_to books_path
    end
  end

end
