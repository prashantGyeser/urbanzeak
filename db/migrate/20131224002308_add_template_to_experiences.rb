class AddTemplateToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :template, :boolean
  end
end
