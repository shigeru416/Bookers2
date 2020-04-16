class UsersController < ApplicationController
	before_action :authenticate_user!
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end
	def show
		@user = User.find(params[:id])
		@book = Book.new
    end
    def index
    	@user = current_user
    	@book = Book.new
    end








	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end
    
end
