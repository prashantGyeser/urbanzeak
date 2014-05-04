# == Schema Information
#
# Table name: hosts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  about      :text
#  created_at :datetime
#  updated_at :datetime
#  avatar     :string(255)
#  user_id    :integer
#

require 'spec_helper'

describe Host do
  #it {should validate_presence_of(:title)}
  #it {should validate_presence_of(:about)}
end
