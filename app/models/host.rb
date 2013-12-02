# == Schema Information
#
# Table name: hosts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  about      :text
#  created_at :datetime
#  updated_at :datetime
#

class Host < ActiveRecord::Base
  validates :title, :about, :presence => true
end
