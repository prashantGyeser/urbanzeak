class AddAvatarToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :avatar, :string
  end
end
