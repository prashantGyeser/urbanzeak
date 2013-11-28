class Experience < ActiveRecord::Base
  validates :name, :description, :price, :exp_date, :exp_time, presence: true



end
