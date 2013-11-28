class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :name
      t.text :description
      t.date :exp_date
      t.time :exp_time
      t.decimal :price
      t.float :latitude
      t.float :longitude
      t.integer :max_seats

      t.timestamps
    end
  end
end
