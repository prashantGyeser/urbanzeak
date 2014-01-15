class CreateAdvanceBookings < ActiveRecord::Migration
  def change
    create_table :advance_bookings do |t|
      t.string :name
      t.string :email
      t.date :booking_date

      t.timestamps
    end
  end
end
