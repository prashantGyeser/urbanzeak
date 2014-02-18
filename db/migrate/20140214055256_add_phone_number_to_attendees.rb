class AddPhoneNumberToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :phone_number, :string
    add_column :attendees, :email, :string
  end
end
