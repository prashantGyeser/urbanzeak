class AddMaxSeatsToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :max_seats, :integer
  end
end
