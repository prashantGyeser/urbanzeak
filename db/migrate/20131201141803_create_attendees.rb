class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :seats
      t.integer :user_id
      t.integer :experience_id

      t.timestamps
    end
  end
end
