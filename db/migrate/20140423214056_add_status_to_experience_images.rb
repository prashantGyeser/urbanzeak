class AddStatusToExperienceImages < ActiveRecord::Migration
  def change
    add_column :experience_images, :status, :string
  end
end
