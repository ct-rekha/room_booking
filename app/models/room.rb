class Room
	include Mongoid::Document

	has_many :bookings

	field :name, type: String
	field :description, type: String

  validates :name, uniqueness: true

  def self.filter(search)
    @bookings = Booking.all.to_a
    p "*"*20
    p search[:end]
    p "*"*20
    @pass = []
    if search[:start] !=  nil and search[:start] != ""
      if Booking.where(start_time: search[:start],end_time: search[:end]).exists?
        @bookings.each do |b|
          if b[:start_time] == search[:start] or b[:end_time] == search[:end]
            p "*"*20
            p search[:end]
            p "*"*20
            @room_id = b[:room_id]
          end
        end

        if @room_id != nil
          p "*"*20
          p @room_id
          p "*"*20
          @room = Room.all.to_a
          @room.each do |i| 
            @r_id = i.id
            unless @r_id == @room_id
              @pass<<i
            end
          end
          return @pass
        end
      else
        return Room.all
      end
    else
      return Room.all
    end
  end

end