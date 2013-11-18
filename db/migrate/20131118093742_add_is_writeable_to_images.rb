class AddIsWriteableToImages < ActiveRecord::Migration
  def change
    add_column :images, :isWriteable, :boolean
  end
end
