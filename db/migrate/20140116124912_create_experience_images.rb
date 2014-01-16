class CreateExperienceImages < ActiveRecord::Migration
  def change
    create_table :experience_images do |t|
      t.string :image
      t.integer :experience_id
      t.string :type

      t.timestamps
    end
  end
end
