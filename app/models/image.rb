class Image < ActiveRecord::Base
  belongs_to :experience
  mount_uploader :url, ImageUploader
end
