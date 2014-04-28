class AddUrlToExperienceImages < ActiveRecord::Migration
  def change
    add_column :experience_images, :url, :string
  end
end
