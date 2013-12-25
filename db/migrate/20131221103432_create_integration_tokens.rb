class CreateIntegrationTokens < ActiveRecord::Migration
  def change
    create_table :integration_tokens do |t|
      t.string :token
      t.string :provider
      t.integer :user_id
      t.text :returned_values

      t.timestamps
    end
  end
end
