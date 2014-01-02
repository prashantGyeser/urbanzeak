class RemoveMessageFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :email, :string
    remove_column :messages, :message, :text
  end
end
