class BooksController < ApplicationController
	before_action :authenticate_user!, except: [:top, :about]

	def top
	end
	def about
	end
	def index
		@user_you = current_user
		@post_book = Book.new
		@books = Book.all
	end
	def create
        @post_book = Book.new(book_params)
        @post_book.user_id = current_user.id
        if @post_book.save
           redirect_to book_path(@post_book.id), notice:'You have creatad book successfully.'
        else
        	@user_you = current_user
        	@books = Book.all
           render :index
        end
	end 
	def show
		@user_you = current_user
		@post_book = Book.new
		@book = Book.find(params[:id])
		@user = @book.user

	end
	def edit
		@book = Book.find(params[:id])
		if current_user.id != @book.user_id
		   redirect_to books_path
        end
	end
	def update
		book = Book.find(params[:id])
		book.update(book_params)
		redirect_to book_path(book.id), notice:'You have updated book successfully.'
	end
    def destroy
    	@book = Book.find(params[:id])
    	@book.destroy
    	redirect_to books_path, notice:'You have deleted book successfully.'
    end 

	private
	def book_params
        params.require(:book).permit(:title, :body)
    end
end