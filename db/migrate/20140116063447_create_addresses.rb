class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line_one
      t.string :line_two
      t.string :city
      t.string :state
      t.string :pincode
      t.string :country
      t.integer :experience_id

      t.timestamps
    end
  end
end
