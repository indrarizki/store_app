class RoomMessagesController < ApplicationController

  before_action :authenticate_user!

  def create

    @room_message = current_user.room_messages.build(room_message_params)

    if @room_message.save
        redirect_to room_path(@room_message.room)
    else
      head :unprocessable_entity
    end

  end

  private

  def room_message_params
    params.require(:room_message).permit(:content, :room_id)
  end

end
