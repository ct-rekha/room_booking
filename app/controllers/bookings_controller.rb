class BookingsController < ApplicationController

	# before_action :user_is_logged_in
	before_action :set_booking, only:[:edit, :update]

	def index
    if session[:user_id] == nil
    	flash[:notice] = "Your not logged in user"
    	redirect_to root_path 
		else
			@bookings = Booking.all
			# order("created_at DESC")
		end
	end

	def show
		@booking = Booking.find(params[:id])
	end


	def new
		@booking = Booking.new()
	end

	def create
		if Booking.date_exists(booking_params)
			flash[:notice]="Cannot book room, try again"
			redirect_to new_booking_path(:room_id => booking_params[:room_id],:name => booking_params[:name])

		elsif Booking.available(booking_params)
			flash[:notice]="Room is not available"
			redirect_to new_booking_path(:room_id => booking_params[:room_id],:name => booking_params[:name])

		else
			@room = Room.where(:id => booking_params["room_id"]).first
			@booking = @room.bookings.create!(:start_time => booking_params["start_time"], :end_time => booking_params["end_time"], name: booking_params[:name],username: current_user.name,:room_id => booking_params["room_id"])
			
			if @booking.save!
				flash[:success] = "you have successfully booked your conference room"
				redirect_to booking_path(@booking,:room_id => booking_params[:room_id])
			end
		end
	end



	def edit
		@booking= Booking.find(params[:id])
	end

	def update
		if Booking.date_exists(booking_params)
			flash[:notice]="Room is not available in this time period"
			redirect_to edit_booking_path(:room_id => booking_params[:room_id],:name => booking_params[:name])


		elsif Booking.available(booking_params)
			flash[:notice]="Room is not available in this time period"
			redirect_to edit_booking_path(:room_id => booking_params[:room_id],:name => booking_params[:name])

		else
			@room = Room.where(:id => params[:room_id]).first
			@booking = Booking.find(params[:id])
			if @booking.update!(booking_params)
				flash[:success]="you have successfully updated your profile"
				render 'show'
			end
		end
	end

	def destroy
		@booking = Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = 'Booking was successfully canceled.'
    redirect_to rooms_path
  end

	def set_booking
		@booking = Booking.find(params[:id])
	end

	def booking_params
		params.require(:booking).permit(:start_time, :end_time, :name,:username,:room_id)
	end

end

