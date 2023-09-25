class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.string :time
      t.boolean :status, :default => true

      t.timestamps
    end
  end
end
