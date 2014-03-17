# == Schema Information
#
# Table name: integration_tokens
#
#  id              :integer          not null, primary key
#  token           :string(255)
#  provider        :string(255)
#  user_id         :integer
#  returned_values :text
#  created_at      :datetime
#  updated_at      :datetime
#  post_to_fb_wall :boolean
#

class IntegrationToken < ActiveRecord::Base
  belongs_to :user
end
