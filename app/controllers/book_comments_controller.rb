class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    @book_comment = BookComment.new
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = book.id
    @comment.save
    # redirect_to book_path(book.id)
    # 非同期のため削除
  end

  def destroy
    # book = Book.find(params[:book_id]) # showページ遷移用変数
    @book_comment = BookComment.new
    @comment = BookComment.find(params[:id]) #findでPKを検索
    @comment.destroy
    # redirect_to book_path(book.id)
    # 非同期のため削除
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:body)
  end
end
