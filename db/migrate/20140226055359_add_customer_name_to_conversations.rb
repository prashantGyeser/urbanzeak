class AddCustomerNameToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :customer_name, :string
  end
end
