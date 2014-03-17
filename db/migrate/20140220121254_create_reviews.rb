class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :email
      t.text :comment
      t.integer :experience_id

      t.timestamps
    end
  end
end
