class AddExperienceIdToAdvanceBookings < ActiveRecord::Migration
  def change
    add_column :advance_bookings, :experience_id, :integer
  end
end
