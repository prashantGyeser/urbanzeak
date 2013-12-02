class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :name
      t.text :description
      t.decimal :price, :precision => 15, :scale => 2
      t.date :exp_date
      t.time :exp_time
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
