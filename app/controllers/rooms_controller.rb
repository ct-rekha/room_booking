class RoomsController < ApplicationController

  def new
  	@room = Room.new
  end

  def index
    if session[:user_id] == nil
      flash[:notice] = "Your not logged in user"
      redirect_to root_path 
    else
      @rooms = Room.filter(room_params) 
    end    
  end


  def show
    @room = Room.find(params[:id])
  end

  def create
    @room = Room.new(room_params)  
    if @room.save!
      flash[:success] = "checking for availble rooms"
      redirect_to rooms_path
    end
  end

	def edit
 		@room = Room.find(params[:id])
	end


 	private

 	def room_params
 		params.permit(:name, :description, :start,:end)
 	end
end