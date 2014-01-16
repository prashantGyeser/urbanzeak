class AddIndex < ActiveRecord::Migration
  def self.up
    add_index :attendees, :user_id
    add_index :attendees, :experience_id
    add_index :exp_images, :experience_id
    add_index :experiences, :user_id
    add_index :hosts, :user_id
  end

  def self.down
    remove_index :attendees, :column => :user_id
    remove_index :attendees, :column => :experience_id
    remove_index :exp_images, :column => :experience_id
    remove_index :experiences, :column => :user_id
    remove_index :hosts, :column => :user_id
  end
end
