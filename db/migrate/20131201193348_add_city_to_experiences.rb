class AddCityToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :city, :string
  end
end
