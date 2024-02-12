class FavoritesController < ApplicationController
  def create
    # if !Favorite.find(book_id: params[:book_id], user_id: current_user.id).exists?
    #判別はビューで行うので削除
      book = Book.find(params[:book_id])
      @favorite = current_user.favorites.new(book_id: book.id)
      @favorite.save
     book.update(star: book.favorites.count) # いいね数の更新
      @books = Book.order(star: :desc) # jsファイル用変数
      # render 'replace_btn'
      # renderは非同期のため削除
    # end
  end

  def destroy
    # if Favorite.find(book_id: params[:book_id], user_id: current_user.id).exists?
    #判別はビューで行うので削除
      book = Book.find(params[:book_id])
      @favorite = current_user.favorites.find_by(book_id: book.id)
      @favorite.destroy
      book.update(good: book.favorites.count) # いいね数の更新
      @books = Book.order(good: :desc) # jsファイル用変数
      # render 'replace_btn'
      # renderは非同期のため削除
    # end
  end
end
