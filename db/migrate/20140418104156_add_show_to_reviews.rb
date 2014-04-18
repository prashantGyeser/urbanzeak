class AddShowToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :show, :boolean
  end
end
