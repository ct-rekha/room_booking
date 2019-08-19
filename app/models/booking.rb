class Booking
	include Mongoid::Document
	
	# validate :overlapping

	# scope :overlapping, -> { |Booking|
	# 	where("start_date <= ? AND ? <= end_date", Booking.end_date, Booking.start_date)
 #  	}

	# private

	# def no_reservation_overlap
	#   if (Booking.overlapping(start_time, end_time).any?)
	#      errors.add(:end_time, 'it overlaps another reservation')
	#   end
	# end



	belongs_to :room
	
	field :name, type: String
	field :status,type: String, :default => "Booked"
	field :start_time, type: DateTime
	field :end_time, type: DateTime

	validates :start_time, presence: true
	validates :end_time, presence: true


end