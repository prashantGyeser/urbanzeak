class CreateEventDates < ActiveRecord::Migration
  def change
    create_table :event_dates do |t|
      t.date :event_date
      t.time :event_time
      t.integer :experience_id

      t.timestamps
    end
  end
end
