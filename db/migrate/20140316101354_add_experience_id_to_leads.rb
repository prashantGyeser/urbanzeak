class AddExperienceIdToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :experience_id, :integer
  end
end
