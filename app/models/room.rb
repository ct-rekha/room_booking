class Room
	include Mongoid::Document

	has_many :bookings

	field :name, type: String
	field :description, type: String

  validates :name, uniqueness: true

  def self.search(search)
    if search     
      return Room.all
    else
      return Room.all
    end
  end
end