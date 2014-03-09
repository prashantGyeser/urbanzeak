class AddCategoryToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :category, :string
  end
end
