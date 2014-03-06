class AddTaglineToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :tagline, :string
  end
end
