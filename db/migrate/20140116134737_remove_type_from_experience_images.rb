class RemoveTypeFromExperienceImages < ActiveRecord::Migration
  def change
    remove_column :experience_images, :type, :string
  end
end
