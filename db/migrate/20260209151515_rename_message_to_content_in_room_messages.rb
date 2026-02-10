class RenameMessageToContentInRoomMessages < ActiveRecord::Migration[8.1]
  def change
    rename_column :room_messages, :message, :content
  end
end
