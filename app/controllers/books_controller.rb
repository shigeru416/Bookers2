class BooksController < ApplicationController
	before_action :authenticate_user!, except: [:top, :about]
	def top
	end
	def about
	end
	def index
	end
end
