class BookingsController < ApplicationController

	# before_action :user_is_logged_in
	before_action :set_booking, only:[:edit, :update]

	def index
    if session[:user_id] == nil
    	flash[:notice] = "Your not logged in user"
    	redirect_to root_path 
		else
			@bookings = Booking.all
		end
	end

	def show
		@booking = Booking.find(params[:id])
	end


	def new
		@booking = Booking.new()
	end


	def available?(booking_params)
		Booking.all.each do|i|
			if i[:end_time] > booking_params[:start_time]
				return true
			end
		end
		return false
	end


	def create
		if booking_params[:start_time] <= Time.current or booking_params[:end_time] < booking_params[:start_time] 
			flash[:notice]="enter correct Date"
			redirect_to rooms_path

		elsif available?(booking_params)
			flash[:notice]="enter correct Date"
			redirect_to rooms_path


		elsif (Booking.where(:start_time => booking_params["start_time"]) and Booking.where(:end_time => booking_params["end_time"]) or Booking.where(:room_id => booking_params["room_id"])).exists?		
			flash[:notice]="room not available"
			redirect_to rooms_path
		else
			@room = Room.where(:id => booking_params["room_id"]).first
			@booking = @room.bookings.create!(:start_time => booking_params["start_time"], :end_time => booking_params["end_time"], name: booking_params[:name],:room_id => booking_params["room_id"])
			if @booking.save!
				flash[:success] = "you have successfully booked your conference room"
				render 'show'
			end
		end
	end

	def edit
		@booking= Booking.find(params[:id])
	end

	def update
		# @room = Room.where(:id => booking_params["room_id"]).first
		@booking = Booking.find(params[:id])
		if @booking.update(booking_params)
			flash[:success]="you have successfully updated your profile"
			render 'show'
		else
			render 'edit'
		end
	end

	def destroy
		@booking = Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = 'Booking was successfully canceled.'
    redirect_to rooms_path
  end

	private 

	def set_booking
		@booking = Booking.find(params[:id])
	end

	def booking_params
		params.require(:booking).permit(:start_time, :end_time, :name, :room_id)
	end

end

