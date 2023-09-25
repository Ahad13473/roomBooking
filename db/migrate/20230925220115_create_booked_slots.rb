class CreateBookedSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :booked_slots do |t|
      t.integer :slot_id
      t.string :name
      t.string :email
      t.string :on_day
      t.date :on_date
      t.integer :room_id

      t.timestamps
    end
  end
end
