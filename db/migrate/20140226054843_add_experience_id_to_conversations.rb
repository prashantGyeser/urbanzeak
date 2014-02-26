class AddExperienceIdToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :experience_id, :integer
  end
end
