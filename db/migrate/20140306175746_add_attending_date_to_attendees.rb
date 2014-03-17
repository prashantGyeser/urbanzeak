class AddAttendingDateToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :attending_date, :date
  end
end
