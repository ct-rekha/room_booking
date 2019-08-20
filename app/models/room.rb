class Room
	include Mongoid::Document

	has_many :bookings

  field :start_at, type: DateTime
  field :end_at, type: DateTime
	field :name, type: String
	field :description, type: String

  validates :name, uniqueness: true

end











