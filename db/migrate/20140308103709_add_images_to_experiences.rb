class AddImagesToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :images, :string
  end
end
