class AddPriceToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :price, :decimal
    add_column :attendees, :attending_on, :date
    add_column :attendees, :attending_at, :time
  end
end
