require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

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

    # Adding the vendor/plugin dir to the precompile list
    config.assets.paths << Rails.root.join("vendor")

    # Adding this to fix the issue with dashboard/application.js not being served
    config.assets.precompile += %w( dashboard/reports.js )
    config.assets.precompile += %w( jquery-slider/jquery.sidr.min )
    config.assets.precompile += %w( jquery-slimscroll/jquery.slimscroll.min )
    config.assets.precompile += %w( pace/pace.min )
    config.assets.precompile += %w( jquery-numberAnimate/jquery.animateNumbers )
    config.assets.precompile += %w( jquery-morris-chart/js/morris.min )
    config.assets.precompile += %w( dashboard/core.js )
    config.assets.precompile += %w( dashboard/chat.js )
    config.assets.precompile += %w( dashboard/demo.js )
    config.assets.precompile += %w( dashboard/calendar.js )
    config.assets.precompile += %w( bootstrap-datepicker/css/datepicker.css )
    config.assets.precompile += %w( bootstrap-timepicker/css/bootstrap-timepicker.css )
    config.assets.precompile += %w( bootstrap-datepicker/js/bootstrap-datepicker.js )
    config.assets.precompile += %w( bootstrap-timepicker/js/bootstrap-timepicker.min.js )
    config.assets.precompile += %w( dashboard/experiences.js.erb )
    config.assets.precompile += %w( dashboard/profile.js )
    config.assets.precompile += %w( dashboard/experience_index.js )
    config.assets.precompile += %w( dashboard/messages.js )
    config.assets.precompile += %w( plugins/bootstrap-datepicker/css/datepicker.css )
    config.assets.precompile += %w( plugins/bootstrap-datepicker/js/bootstrap-datepicker.js )
    config.assets.precompile += %w( dashboard/reviews.js )
    config.assets.precompile += %w( homepage/template.css )
    config.assets.precompile += %w( homepage/core.js )
    config.assets.precompile += %w( dashboard/experiences.js )
    config.assets.precompile += %w( dashboard/file_picker.js )
    config.assets.precompile += %w( plugins/chardinjs/chardinjs.min.js )
    config.assets.precompile += %w( plugins/chardinjs/chardinjs.css )
    config.assets.precompile += %w( dashboard/algo.js )
    config.assets.precompile += %w( dashboard/algo.css )
    config.assets.precompile += %w( icon/top-tray.png )

  end
end
