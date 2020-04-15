class BooksController < ApplicationController
	before_action :authenticate_user!, except: [:top, :about]
	def top
	end
	def about
	end
	def index
	end
	def new
		@book = Book.new
	end
	def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @book.save
        redirect_to user_path(current_user.id)
	end 

	private
	def book_params
        params.require(:book).prermit(:title, :body)
	end
end
