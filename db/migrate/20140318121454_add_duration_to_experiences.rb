class AddDurationToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :hours, :integer
    add_column :experiences, :minutes, :integer
  end
end
