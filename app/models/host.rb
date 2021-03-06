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
#  name       :string(255)
#

class Host < ActiveRecord::Base
  validates :about, :presence => true
  validates :user_id, :uniqueness => true

  mount_uploader :avatar, AvatarUploader


end
