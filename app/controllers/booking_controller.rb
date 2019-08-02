class BookingController < ApplicationController

	def index
		@bookings = Booking.all
	end

	def new
		@booking = Booking.new
	end

	def create
		@booking = Booking.new(start_time: Time.now,user_id: @users.id,room_id: @rooms.id)
		# @booking.room = @rooms
		if @booking.save
			redirect_to room_bookings_path
		else
			render 'new'
		end
	end

	def edit
		
	end


	def show
		

	end

	private

	def booking_params
 		params.require(:user).permit(:start_time, :end_time)
 	end

end