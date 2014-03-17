class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.integer :user_id
      t.integer :potential_id

      t.timestamps
    end
  end
end
