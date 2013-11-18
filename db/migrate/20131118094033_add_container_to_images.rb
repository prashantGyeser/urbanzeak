class AddContainerToImages < ActiveRecord::Migration
  def change
    add_column :images, :container, :string
  end
end
