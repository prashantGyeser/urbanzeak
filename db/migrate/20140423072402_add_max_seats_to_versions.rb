class AddMaxSeatsToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :max_seats, :integer
  end
end
