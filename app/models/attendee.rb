# == Schema Information
#
# Table name: attendees
#
#  id             :integer          not null, primary key
#  seats          :integer
#  user_id        :integer
#  experience_id  :integer
#  created_at     :datetime
#  updated_at     :datetime
#  phone_number   :string(255)
#  email          :string(255)
#  attending_date :date
#  price          :decimal(, )
#  attending_on   :date
#  attending_at   :time
#

class Attendee < ActiveRecord::Base
  belongs_to :experience
  after_create :confirmation_email


  def confirmation_email
    experience = Experience.find(self.experience_id)
    experience_time = ExperienceDate.where(:experience_id => experience.id).first.experience_time
    experience_date =  ExperienceDate.where(:experience_id => experience.id).first.experience_date
    NotificationsMailer.joined_experience(experience, self, experience_time, experience_date).deliver
  end

end
