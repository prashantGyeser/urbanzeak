class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :venue
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
