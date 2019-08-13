namespace :room_booking do
  task :create_room => :environment do
  	@room =  Room.new(name: "Tiger",description: "aaaaaaaaaaa")
  	unless Room.where(name: "Tiger").exists?
  		@room.save!
  	end
  end
end
