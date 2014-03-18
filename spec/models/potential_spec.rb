# == Schema Information
#
# Table name: potentials
#
#  id             :integer          not null, primary key
#  site           :string(255)
#  site_type      :string(255)
#  potential_type :string(255)
#  description    :text
#  todo           :text
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe Potential do
  pending "add some examples to (or delete) #{__FILE__}"
end
