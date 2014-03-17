class AddLandMarkToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :land_mark, :string
  end
end
