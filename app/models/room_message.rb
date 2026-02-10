class RoomMessage < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :content, presence: true

  after_create_commit :broadcast_message

  private

  def broadcast_message
    RoomChannel.broadcast_to(
      room,
      {
        user: user.email,
        content: content
      }
    )
  end
end
