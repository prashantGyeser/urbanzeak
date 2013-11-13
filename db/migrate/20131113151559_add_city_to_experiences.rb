class AddCityToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :city, :string
    add_column :experiences, :categrory, :string
  end
end
