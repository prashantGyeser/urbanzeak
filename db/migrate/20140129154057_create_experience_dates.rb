class CreateExperienceDates < ActiveRecord::Migration
  def change
    create_table :experience_dates do |t|
      t.date :experience_date
      t.time :experience_time
      t.integer :experience_id

      t.timestamps
    end
  end
end
