class AddPostFbWallToIntegrationTokens < ActiveRecord::Migration
  def change
    add_column :integration_tokens, :post_to_fb_wall, :boolean
  end
end
