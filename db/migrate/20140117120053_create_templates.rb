class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.text :summary
      t.text :description
      t.text :what_does_it_include
      t.text :things_to_remember
      t.decimal :price
      t.date :exp_date
      t.time :exp_time
      t.float :latitude
      t.float :longitude
      t.string :address_line_one
      t.string :address_line_two
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.string :landmark
      t.integer :max_seats
      t.string :random_id

      t.timestamps
    end
  end
end
