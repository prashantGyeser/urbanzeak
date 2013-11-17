class AddEventDateToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :experience_date, :date
    add_column :experiences, :experience_time, :time
  end
end
