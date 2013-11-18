class AddIsMimeTypeToImages < ActiveRecord::Migration
  def change
    add_column :images, :mimetype, :string
    add_column :images, :size, :float
  end
end
