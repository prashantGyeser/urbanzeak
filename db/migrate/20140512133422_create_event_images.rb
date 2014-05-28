class CreateEventImages < ActiveRecord::Migration
  def change
    create_table :event_images do |t|
      t.string :url
      t.string :filename
      t.integer :event_id

      t.timestamps
    end
  end
end
