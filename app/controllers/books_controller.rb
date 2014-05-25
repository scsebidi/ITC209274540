class BooksController < ApplicationController
  def show
    @books= Book.all
  end

end
