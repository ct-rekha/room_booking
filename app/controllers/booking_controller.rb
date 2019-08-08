class BookingController < ApplicationController

	before_action :set_user, only: [:edit, :update]

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
		if Booking.where(:start_time => booking_params["start_time"], :end_time => booking_params["end_time"]).exists?
			flash[:notice]="room not available"
			#render 'show'
			redirect_to rooms_path
		else
			@booking = Booking.find_or_create_by!(:start_time => booking_params["start_time"], :end_time => booking_params["end_time"])
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
		if @user.update(booking_params)
			flash[:notice]="you have successfully updated your profile"
			#render 'show'
			redirect_to @booking
		else
			render 'edit'
			#redirect_to @booking
		end
	end

	private 

	def set_user
		@user = User.find(params[:id])
	end

	def booking_params
		params.require(:booking).permit(:start_time, :end_time)
	end

end

