class CreateExpImages < ActiveRecord::Migration
  def change
    create_table :exp_images do |t|
      t.string :url
      t.integer :experience_id

      t.timestamps
    end
  end
end
