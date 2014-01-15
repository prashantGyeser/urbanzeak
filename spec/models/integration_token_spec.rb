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

require 'spec_helper'

describe IntegrationToken do
  pending "add some examples to (or delete) #{__FILE__}"
end
