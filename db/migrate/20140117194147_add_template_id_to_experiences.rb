class AddTemplateIdToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :template_id, :integer
  end
end
