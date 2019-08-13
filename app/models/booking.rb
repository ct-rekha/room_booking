class Booking
	include Mongoid::Document
	
	belongs_to :room
	
	field :name, type: String
	field :status,type: String, :default => "Booked"
	field :start_time, type: DateTime
	field :end_time, type: DateTime

	validates :start_time, presence: true
	validates :end_time, presence: true


end