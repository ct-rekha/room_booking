class Room
	include Mongoid::Document
	field :name, type: String
	field :description, type: String

	validates :name, presence: true, length: {minimum: 5, maximum: 16}
	validates :description, presence: true

end