class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :title
      t.text :about

      t.timestamps
    end
  end
end
