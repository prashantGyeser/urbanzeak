# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#  city                   :string(255)
#  host                   :boolean
#  guid                   :string(255)
#  internal_email_id      :string(255)
#  tour_completed         :boolean
#  subdomain              :string(255)
#

class User < ActiveRecord::Base
  has_shortened_urls
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_validation :downcase_subdomain

  validates :first_name, :subdomain, :presence => true

  # Making sure users do not use a subdomain we might need
  validates_exclusion_of :subdomain, in: ['www', 'admin', 'dashboard', 'pop', 'mail', 'ftp', 'ssl', 'sftp']
  # Ensuring the subdomain is unique
  validates :subdomain, :uniqueness => true
  validates :subdomain, :length => { :in => 3..50}
  validates_format_of :subdomain, :with => /\A[a-zA-Z0-9\#\*][a-zA-Z0-9\#\*\.\(\)\s\-_]*[a-zA-Z0-9\.\)]\z/, :message => 'can only contain alphanumeric characters and dashes.'

  has_many :integration_tokens
  has_many :templates
  has_many :conversations
  has_many :experiences

  #after_create :send_welcome_email
  #after_create :autoresponder
  after_create :add_guid
  after_create :set_tour_status
  after_create :set_host

  private

  def add_guid
    self.guid = ('a'..'z').to_a.shuffle[0,20].join
    self.internal_email_id = self.guid + '@inbound.urbanzeak.com'
    self.save
  end

  def set_tour_status
    self.tour_completed = false
    self.save
  end

  def set_host
    self.host = true
    save
  end

  def send_welcome_email
    UserMailer.signup_confirmation(self).deliver
  end

  def autoresponder
    time_30_mins_from_now_utc = (Time.now.utc) + (32*60)
    time_to_send_this_mail_at = time_30_mins_from_now_utc.strftime("%Y-%m-%d %H:%M:%S")
    UserMailer.founder_welcome(self, time_to_send_this_mail_at).deliver
  end

  def downcase_subdomain
    self.subdomain = self.subdomain.downcase if self.subdomain.present?
  end

end
