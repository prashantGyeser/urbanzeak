class AddShortenedUrlToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :shortened_url, :string
  end
end
