class AddFileNameToExperienceImages < ActiveRecord::Migration
  def change
    add_column :experience_images, :file_name, :string
  end
end
