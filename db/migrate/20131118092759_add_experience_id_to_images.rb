class AddExperienceIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :experience_id, :integer
  end
end
