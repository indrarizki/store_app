class RoomsController < ApplicationController

  before_action :authenticate_user!

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @room_messages = @room.room_messages.includes(:user)
    @room_message = RoomMessage.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to @room
    else
      render :index
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end

end
