class Booking
	include Mongoid::Document
	
	# belongs_to :room

	field :start_time, type: DateTime
	field :end_time, type: DateTime

	validates :start_time, presence: true
	validates :end_time, presence: true

	# def overlaps?(other)
 #    start_time <= other.end_time && other.start_time <= end_time
 #  end

 #  # Return a scope for all interval overlapping the given interval, excluding the given interval itself
 #  scope :overlapping, -> { where("id <> ? AND start_time <= ? AND ? <= end_time", booking.id, booking.end_time, booking.start_time)
  # }


end