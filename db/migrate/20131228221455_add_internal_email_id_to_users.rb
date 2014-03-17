class AddInternalEmailIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :internal_email_id, :string
  end
end
