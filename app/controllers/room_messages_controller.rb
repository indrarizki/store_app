class RoomMessagesController < ApplicationController

  before_action :authenticate_user!

  def create
    @room = Room.find(room_message_params[:room_id])

    @room_message = @room.room_messages.build(room_message_params)
    @room_message.user = current_user

    if @room_message.save
      redirect_to room_path(@room), status: :see_other
    else
      redirect_to room_path(@room), alert: "Failed to send message", status: :see_other
    end
  end

  private

  def room_message_params
    params.require(:room_message).permit(:content, :room_id)
  end

end
