class CreatePotentials < ActiveRecord::Migration
  def change
    create_table :potentials do |t|
      t.string :site
      t.string :site_type
      t.string :potential_type
      t.text :description
      t.text :todo

      t.timestamps
    end
  end
end
