class AddRandomIdToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :random_id, :string
  end
end
