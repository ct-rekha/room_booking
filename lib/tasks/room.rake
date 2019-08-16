namespace :room_booking do
	rooms = [{:name => "hydra",:description => "blahblahship"},
		{:name => "titan",:description => "blahblahblah"},
		{:name => "sully",:description => "Miracle on the Hudson"},
		{:name => "Inception",:description => "Cobb steals information from his targets by entering their dreams"},
		{:name => "jacksparrow",:description => "pirates Of the Carribbean"},
		{:name => "Prestige",:description => "Two friends and fellow magicians"}]
		
		
  task :create_room => :environment do
  	msg = "xyz"
  	rooms.each do |room|
			@room =  Room.new(name: room[:name],description: room[:description])
	  	unless Room.where(name: room[:name]).exists?
	  		@room.save!
	  	end
		end
  end
end



