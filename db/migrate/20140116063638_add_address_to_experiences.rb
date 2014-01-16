class AddAddressToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :line_one, :string
    add_column :experiences, :line_two, :string
    add_column :experiences, :state, :string
    add_column :experiences, :pincode, :string
    add_column :experiences, :country, :string
  end
end
