class AddWhatDoesThisIncludeToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :what_does_this_include, :text
    add_column :experiences, :things_to_remember, :text
  end
end
