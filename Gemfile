source 'https://rubygems.org'
source 'https://hKxDZcxZyrm25AbWxg4M@gem.fury.io/app19602358_heroku_com/'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 4.0.4"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
# gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'



group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Postgres Sql gem
gem 'pg'

# Ink filepicker
gem 'filepicker-rails'

# Authentication
gem 'devise'

# Geocoding the location
gem 'geocoder'

# Setting environment variables for the different values that need to be used in different environments
gem "figaro"

# Carrierwave
gem 'carrierwave'

# Image resizing
gem 'rmagick'

# Storing the images in s3
gem 'fog'

# Fancy box for a modal window
gem 'fancybox2-rails', '~> 0.2.4'

# Url shortner
gem 'shortener'

# New relic monitoring tool
gem 'newrelic_rpm'

group :staging, :production do
  # gzip on heroku
  gem 'heroku-deflater'

  # Monitoring tools
  gem 'sentry-raven'
  gem 'bugsnag'
  gem 'exceptiontrap'
  gem 'appsignal'

  # Using puma as the web server
  gem 'puma'

  # Heroku logging
  gem 'rails_12factor'

end

group :production do

end

# Page tracking for hosts
gem 'impressionist'

# Mixpanel tracking
gem 'mixpanel-ruby'

# External service integration api
gem 'temboo'

# Realtime Notifications
gem 'pubnub'
gem 'json'

# Email management for messages to the host from their customers
gem 'griddler'

# Gem to allow access of controller data from a javascript file
gem 'gon'

group :development do
  gem 'annotate'
  gem "better_errors"
  gem "binding_of_caller"
  gem "bullet"
  gem "rails_best_practices"
  gem "reek"
  gem "metric_fu"
  gem 'sprockets_better_errors'
end

group :test, :development do
  gem 'guard'
  gem 'rspec-rails'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'capybara'
  gem 'launchy'
  gem 'guard-rspec', require: false
  gem 'guard-migrate'
  #gem "rb-readline", "~> 0.5.0"
  gem 'rack-mini-profiler'
end

group :test do
  gem 'shoulda-matchers'
end
