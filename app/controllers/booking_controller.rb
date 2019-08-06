class BookingController < ApplicationController

	def index
	 	@bookings = Booking.all
	end

	def show
 		@booking = Booking.find(params[:id])
	end

	def new
		@booking = Booking.new
 	end

	def create
 		@booking = Booking.new(booking_params)
 		if @booking.save
 			flash[:success] = "you have successfully signed up"
 			render 'show'
 		else
 			redirect_to rooms_path
 		end
 	end

 	def edit
 		@booking= Booking.find(params[:id])
	end

 	def update
 		@booking = Booking.find(params[:id])
 		if @user.update(booking_params)
 			flash[:notice]="you have successfully updated your profile"
 			redirect_to @booking
 		else
 			render 'edit'
 		end
 	end

 	private 

 	# def set_user
 	# 	@user = User.find(params[:id])
 	# end

 	def booking_params
 		params.require(:booking).permit(:start_time, :end_time,:length)
 	end

end