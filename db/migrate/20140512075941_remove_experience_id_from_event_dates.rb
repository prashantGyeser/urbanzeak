class RemoveExperienceIdFromEventDates < ActiveRecord::Migration
  def change
    remove_column :event_dates, :experience_id, :integer
  end
end
