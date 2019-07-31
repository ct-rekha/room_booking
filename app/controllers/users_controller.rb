class UsersController < ApplicationController

	
	
	def index
	 	@users = User.all.to_a
	end

	# def show

	# end

	def new
		@user = User.new
 	end
end



































 	# def create
 	# 	@user = User.new(user_params)
 	# 	if @user.save
 	# 		flash[:success] = "you have successfully signed up"
 	# 		redirect_to root_path
 	# 	else
 	# 		render 'new'
 	# 	end
 	# end

 	# def edit

 	# end

 	# def update
 	# 	if @user.update(user_params)
 	# 		flash[:notice]="you have successfully updated your profile"
 	# 		redirect_to @user
 	# 	else
 	# 		render 'edit'
 	# 	end
 	# end

 	# private 

 	# def set_user
 	# 	@user = User.find(params[:id])
 	# end

 	# def user_params
 	# 	params.require(:student).permit(:name, :email)
 	# end

#before_action :set_user, only[:show, :edit, :update]
