class RoomsController < ApplicationController

  def new
  	@room = Room.new
  end

  def index
  	@rooms = Room.all
  end


  def show
    @room = Room.find(params[:id])
  end

  # def self.create
  #   @room = Room.new(:name,:description)
  #   if @rooms.where(:name,:description).exists?
  #     flash[:error] = "room alredy exists"
  #     render 'new'
 	# 	else
  #     if @room.save!
  #     flash[:success] = "you have successfully added new room"
  #     redirect_to rooms_path
  #     end
 	# 	end
  # end

	def edit
 		@room = Room.find(params[:id])
	end

 	# def update
 	# 	@room = Room.find(params[:id])
 	# 	if @room.update(room_params)
 	# 		flash[:notice]="you have successfully updated conference room"
 	# 		redirect_to $room
 	# 	else
 	# 		render 'edit'
 	# 	end
 	# end


 	private

 	def self.room_params
 		params.require(:room).permit(:name, :description)
 	end
end