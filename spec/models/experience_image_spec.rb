# == Schema Information
#
# Table name: experience_images
#
#  id            :integer          not null, primary key
#  image         :string(255)
#  experience_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#  random_id     :string(255)
#  image_type    :string(255)
#  status        :string(255)
#  file_name     :string(255)
#  url           :string(255)
#

require 'spec_helper'

describe ExperienceImage do
  pending "add some examples to (or delete) #{__FILE__}"
end
