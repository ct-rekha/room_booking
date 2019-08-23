class Booking
	include Mongoid::Document

	# validate :available

	belongs_to :room
	
	# def start_time_format format = "%m/%d/%Y %H:%M"
 #  	starts_time.strftime(format)
	# end

	field :name, type: String
	field :username, type: String
	field :status,type: String, :default => "Booked"
	field :start_time, type: DateTime
	field :end_time, type: DateTime
	
	# private

	def self.date_exists(booking_params)
		if booking_params[:start_time] <= Time.current or booking_params[:end_time] < booking_params[:start_time] 
			return true
		# elsif (Booking.where(:start_time => booking_params["start_time"]) and Booking.where(:end_time => booking_params["end_time"]) or Booking.where(:room_id => booking_params["room_id"])).exists?		
		# 	return true
		else
			return false
		end
	end
			

	def self.available(booking_params)
		p booking_params[:start_time]
		Booking.all.each do|i|
			if i[:end_time] > booking_params[:start_time]
				return true
				break
			end
		end
		return false
	end

end