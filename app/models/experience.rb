# == Schema Information
#
# Table name: experiences
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  description            :text
#  price                  :decimal(15, 2)
#  exp_date               :date
#  exp_time               :time
#  latitude               :float
#  longitude              :float
#  created_at             :datetime
#  updated_at             :datetime
#  city                   :string(255)
#  image                  :string(255)
#  user_id                :integer
#  what_does_this_include :text
#  things_to_remember     :text
#  max_seats              :integer
#  template               :boolean
#  shortened_url          :string(255)
#  summary                :text
#  line_one               :string(255)
#  line_two               :string(255)
#  state                  :string(255)
#  pincode                :string(255)
#  country                :string(255)
#  land_mark              :string(255)
#  random_id              :string(255)
#  template_id            :integer
#

class Experience < ActiveRecord::Base
  #validates :name, :description, :price, :exp_date, :exp_time, presence: true

  #has_many :exp_images
  #accepts_nested_attributes_for :exp_images, :reject_if => :all_blank, :allow_destroy => true

  #mount_uploader :image, ImageUploader
  belongs_to :template
  has_many :experience_images

  # Making the model impressionable so that people that view the page can be tracked
  is_impressionable

  def self.total_visits_this_month(user_id)
    experiences = Experience.where(:user_id => user_id)
    @views = 0
    experiences.each do |experience|
      @views = @views + experience.impressionist_count
    end
    return @views
  end

  def self.total_visits_today(user_id)
    experiences = Experience.where(:user_id => user_id)
    views_for_the_day = 0
    experiences.each do |experience|
      views_for_the_day = experience.impressionist_count(:start_date=> (Date.today - 1))
    end
    return views_for_the_day
  end


  def self.todays_sales(user_id)
    experiences = Experience.where(:user_id => user_id)
    sales_today = 0
    experiences.each do |experience|
      attendees = Attendee.where(:experience_id => experience.id).where(:created_at => Date.today)
      .pluck(:seats).sum
      sales_today = sales_today + (attendees * experience.price )
    end
    return sales_today
  end

end
