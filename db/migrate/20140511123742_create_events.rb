class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :tagline
      t.text :what_does_this_include
      t.text :things_to_remember
      t.decimal :price
      t.integer :max_seats
      t.string :line_one
      t.string :line_two
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.string :landmark
      t.integer :duration
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
