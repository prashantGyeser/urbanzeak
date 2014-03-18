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

class Potential < ActiveRecord::Base
end
