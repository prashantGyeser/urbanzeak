class AddFieldsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :to, :string
    add_column :messages, :from, :string
    add_column :messages, :cc, :string
    add_column :messages, :subject, :string
    add_column :messages, :body, :text
    add_column :messages, :raw_text, :text
    add_column :messages, :raw_html, :text
    add_column :messages, :raw_body, :text
    add_column :messages, :headers, :text
    add_column :messages, :raw_headers, :text
  end
end
