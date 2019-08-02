class Booking
	include Mongoid::Document
	field :strat_time, type: DateTime
	field :end_time, type: DateTime
end