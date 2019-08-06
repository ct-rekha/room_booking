class Booking
	include Mongoid::Document
	field :start_time, type: DateTime
	field :end_time, type: DateTime
	field :length, type: Integer
end