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
#  tagline                :string(255)
#  images                 :string(255)
#  category               :string(255)
#  hours                  :integer
#  minutes                :integer
#  slug                   :string(255)
#

class Experience < ActiveRecord::Base
  validates :name, :price, :max_seats, :line_one, :city, :country, presence: true

  #has_many :exp_images
  #accepts_nested_attributes_for :exp_images, :reject_if => :all_blank, :allow_destroy => true

  #mount_uploader :image, ImageUploader
  belongs_to :template
  belongs_to :user
  has_many :experience_images
  has_many :reviews
  has_many :attendees
  has_many :versions

  # Making the model impressionable so that people that view the page can be tracked
  is_impressionable

  accepts_nested_attributes_for :experience_images

  # Changing the url so that it uses a friendly id
  extend FriendlyId
  friendly_id :name, use: :slugged

  before_save :store_version
  after_create :send_experience_created_notification

  def self.total_visits_this_month(user_id)
    experiences = Experience.where(:user_id => user_id)
    @views = 0
    experiences.each do |experience|
      @views = @views + experience.impressionist_count
    end
    return @views
  end

  def self.host_has_experiences(user_id)
    experiences_count = Experience.where(:user_id => user_id).count
    if experiences_count > 0
      return true
    else
      return false
    end
  end

  def self.total_visits_today(user_id)
    experiences = Experience.where(:user_id => user_id)
    views_for_the_day = 0
    experiences.each do |experience|
      views_for_the_day = experience.impressionist_count(:start_date=> (Date.today - 1))
    end
    return views_for_the_day
  end

  def self.host_has_purchases(host)
    experiences = Experience.where(:user_id => host.id)
    has_purchase = false

    experiences.each do |experience|
      attendees_count = Attendee.where(:experience_id => experience.id).count
      if attendees_count > 0
        has_purchase = true
      end
    end

    return has_purchase

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

  def available_dates(seats)
    attendees = Attendee.where(:experience_id => self.id)

    experience_dates = ExperienceDate.where(:experience_id => self.id)
    available_dates = []
    experience_dates.each do |experience_date|

      dates_with_attendees = attendees.where(:attending_date => experience_date.experience_date).pluck(:seats).sum

      if (dates_with_attendees + seats) < self.max_seats
        available_dates << experience_date
      end

    end

    return available_dates

  end

  private

  def store_version
    if self.id.present?
      version = Version.new
      if self.price_changed?
        version.price = self.price_was
      end
      if self.max_seats_changed?
        version.max_seats = self.max_seats_was
      end
      version.save
    end
  end

  def send_experience_created_notification
    host = User.find(self.user_id)
    NotificationsMailer.experience_created(self, host).deliver
  end

end
