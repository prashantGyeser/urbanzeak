# == Schema Information
#
# Table name: experience_images
#
#  id            :integer          not null, primary key
#  image         :string(255)
#  experience_id :integer
#  type          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe ExperienceImage do
  pending "add some examples to (or delete) #{__FILE__}"
end
