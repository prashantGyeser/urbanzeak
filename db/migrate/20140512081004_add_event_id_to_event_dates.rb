class AddEventIdToEventDates < ActiveRecord::Migration
  def change
    add_column :event_dates, :event_id, :integer
  end
end
