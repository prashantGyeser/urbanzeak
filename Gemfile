source 'https://rubygems.org'
source 'https://hKxDZcxZyrm25AbWxg4M@gem.fury.io/app19602358_heroku_com/'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 4.1.1"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
# gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'rubygems-update', '~> 2.2.2'

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

# Use debugger
gem 'debugger', group: [:development, :test]

# Postgres Sql gem
gem 'pg'

# Ink filepicker
gem 'filepicker-rails'

# Authentication
gem 'devise', '~> 3.2.4'

# Url shortner
gem 'shortener'

gem 'friendly_id'

# Carrierwave
gem 'carrierwave'

# Image resizing
gem 'rmagick'

# Storing the images in s3
gem 'fog'

gem 'gon'

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
  # Refer to https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server for details on this.
  gem "rack-timeout"

  # Heroku logging
  gem 'rails_12factor'

  # Heoku cannot find this gem when pushing so adding it there
  # Refer to http://stackoverflow.com/questions/22510461/could-not-find-thread-safe-0-3-0-in-any-of-the-sources for details
  gem 'thread_safe', '~> 0.3.3'

  # New relic monitoring tool
  gem 'newrelic_rpm'
end

# Page tracking for hosts
gem 'impressionist'

# External service integration api
gem 'temboo'

# Email management for messages to the host from their customers
gem 'griddler'

# Intercom settings and gem
gem 'intercom', "~> 2.1.1"


group :development do
  gem 'annotate'
  gem "better_errors"
  gem "binding_of_caller"
  gem "bullet"
  gem "rails_best_practices"
  gem "reek"
  gem "metric_fu"
end

group :test, :development do
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'guard-migrate'
  #gem "rb-readline", "~> 0.5.0"
  #gem 'rack-mini-profiler'
  #gem 'spring'
end

group :test do
  gem 'shoulda-matchers'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'capybara'
  gem 'launchy'
  gem 'email_spec'
  gem 'capybara-screenshot'
  gem 'capybara-email'
  gem 'selenium-webdriver'
end
