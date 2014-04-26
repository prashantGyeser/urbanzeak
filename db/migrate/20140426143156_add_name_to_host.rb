class AddNameToHost < ActiveRecord::Migration
  def change
    add_column :hosts, :name, :string
  end
end
