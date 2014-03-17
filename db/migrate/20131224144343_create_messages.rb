class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.text :message
      t.integer :user_id
      t.integer :experience_id

      t.timestamps
    end
  end
end
