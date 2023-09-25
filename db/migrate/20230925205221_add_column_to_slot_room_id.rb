class AddColumnToSlotRoomId < ActiveRecord::Migration[7.0]
  def change
    add_column :slots, :room_id, :integer
  end
end
