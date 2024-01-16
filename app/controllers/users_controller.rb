class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @books_today = @books.where(created_at: Time.zone.now.all_day)
    @books_2days_ago = @books.where(created_at: 2.day.ago.all_day)
    @books_3days_ago = @books.where(created_at: 3.day.ago.all_day)
    @books_4days_ago = @books.where(created_at: 4.day.ago.all_day)
    @books_5days_ago = @books.where(created_at: 5.day.ago.all_day)
    @books_6days_ago = @books.where(created_at: 6.day.ago.all_day)
    @books_yesterday = @books.where(created_at: 1.day.ago.all_day)
    @books_this_week = @books.where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day)
    @books_last_week = @books.where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day)
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def search
    @user = User.find(params[:user_id])
    @books = @user.books 
    @book = Book.new
    if params[:created_at] == ""
      @search_book = "日付を選択してください"
    else
      create_at = params[:created_at]
      @search_book = @books.where(['created_at LIKE ? ', "#{create_at}%"]).count
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
