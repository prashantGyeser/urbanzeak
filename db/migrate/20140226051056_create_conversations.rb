class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :user_id
      t.string :sender_email_id

      t.timestamps
    end
  end
end
