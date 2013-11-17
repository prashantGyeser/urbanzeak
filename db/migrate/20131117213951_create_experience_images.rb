class CreateExperienceImages < ActiveRecord::Migration
  def change
    create_table :experience_images do |t|
      t.string :name
      t.string :url
      t.integer :experience_id

      t.timestamps
    end
  end
end
