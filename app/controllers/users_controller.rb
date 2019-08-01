class UsersController < ApplicationController

	# before_action :set_user, only[:show, :edit, :update]

	def index
	 	@users = User.all
	end

	def show
 		@user = User.find(params[:_id])
	end

	def new
		@user = User.new
 	end

	def create
 		@user = User.new(user_params)
 		if @user.save
 			flash[:success] = "you have successfully signed up"
 			redirect_to root_path
 		else
 			render 'show'
 		end
 	end

 	def edit
 		@user = User.find(params[:_id])
	end

 	def update
 		@user = User.find(params[:_id])
 		if @user.update(user_params)
 			flash[:notice]="you have successfully updated your profile"
 			redirect_to @user
 		else
 			render 'edit'
 		end
 	end

 	private 

 	# def set_user
 	# 	@user = User.find(params[:id])
 	# end

 	def user_params
 		params.require(:user).permit(:name, :email)
 	end
end

