class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.decimal :price
      t.date :experience_date
      t.time :experience_time
      t.integer :experience_id

      t.timestamps
    end
  end
end
