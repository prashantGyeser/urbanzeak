class AddRandomIdToExperienceImages < ActiveRecord::Migration
  def change
    add_column :experience_images, :random_id, :string
  end
end
