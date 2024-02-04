class TagsController < ApplicationController
    def result
           tag = params[:tag]
           @search_books = Book.where(tag: "#{tag}")
    end
end
