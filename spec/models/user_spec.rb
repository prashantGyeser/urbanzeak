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

require 'spec_helper'

describe User do
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:first_name)}
  it {should validate_presence_of(:subdomain)}
  #it {should have_one(:host)}
end
