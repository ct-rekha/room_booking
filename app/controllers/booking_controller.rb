class BookingController < ApplicationController

	before_action :set_booking, only: [:edit, :update]

	def index
		@bookings = Booking.all
	end

	def show
		@booking = Booking.find(params[:id])
	end

	def new
		@booking = Booking.new()
	end


	def create
		@room = Room.find(:room_id)
		# p "*"*2
		p @room
		if (Booking.where(:start_time => booking_params["start_time"]) and Booking.where(:end_time => booking_params["end_time"]) or Booking.where(:room_id => booking_params["room_id"])).exists?		
			flash[:notice]="room not available"
			redirect_to rooms_path
			#render 'show'
			# format.html {redirect_to rooms_path, notice: 'room is not available'}
		else
			@booking = Booking.create!(:start_time => booking_params["start_time"], :end_time => booking_params["end_time"], name: current_user.name,:room_id => booking_params["room_id"])
			if @booking.save!
				flash[:success] = "you have successfully booked your conference room"
				render 'show'
			end
		end
	end

	def edit
		# @booking= Booking.find(params[:id])
	end

	def update
		# @booking = Booking.find(params[:id])
		if @booking.update(booking_params)
			flash[:success]="you have successfully updated your profile"
			#render 'show'
			redirect_to @booking
		else
			render 'edit'
			#redirect_to @booking
		end
	end

	# private 

	def set_user
		@booking = Booking.find(params[:id])
	end

	def booking_params
		params.require(:booking).permit(:start_time, :end_time, :name, :room_id)
	end

end

