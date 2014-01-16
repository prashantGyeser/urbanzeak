class AddImageTypeFromExperienceImages < ActiveRecord::Migration
  def change
    add_column :experience_images, :image_type, :string
  end
end
