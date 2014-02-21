require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Urbanzeak
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Precompiling assets in the vendor dir. Rails does not do it by default
    config.assets.enable = true

    # Ink filepicker config
    config.filepicker_rails.api_key = "ASJiChL2QqvYT9LxDuUqgz"

    config.generators do |g|
      g.test_framework :rspec,
                       :fixtures => true,
                       :view_specs => false,
                       :helper_specs => false,
                       :routing_specs => false,
                       :controller_specs => true,
                       :request_specs => true
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end

    # Adding this to fix the issue with dashboard/application.js not being served
    config.assets.precompile += %w( dashboard/dashboard.js )
    config.assets.precompile += %w( jquery-slider/jquery.sidr.min )
    config.assets.precompile += %w( jquery-slimscroll/jquery.slimscroll.min )
    config.assets.precompile += %w( pace/pace.min )
    config.assets.precompile += %w( jquery-numberAnimate/jquery.animateNumbers )
    config.assets.precompile += %w( jquery-morris-chart/js/morris.min )
    config.assets.precompile += %w( dashboard/core.js )
    config.assets.precompile += %w( dashboard/chat.js )
    config.assets.precompile += %w( dashboard/demo.js )
    config.assets.precompile += %w( dashboard/calendar.js )
    config.assets.precompile += %w( dropzone/css/dropzone.css )
    config.assets.precompile += %w( bootstrap-datepicker/css/datepicker.css )
    config.assets.precompile += %w( bootstrap-timepicker/css/bootstrap-timepicker.css )
    config.assets.precompile += %w( dropzone/dropzone.min.js )
    config.assets.precompile += %w( bootstrap-datepicker/js/bootstrap-datepicker.js )
    config.assets.precompile += %w( bootstrap-timepicker/js/bootstrap-timepicker.min.js )
    config.assets.precompile += %w( dashboard/experiences.js )
    config.assets.precompile += %w( dashboard/profile.js )
    config.assets.precompile += %w( dashboard/experience_index.js )

  end
end
