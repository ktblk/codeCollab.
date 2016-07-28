require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Codecollab
  class Application < Rails::Application

    config.before_initialize do
        dev = File.join(Rails.root, 'config', 'config.yml')
        YAML.load(File.open(dev)).each do |key,value|
          ENV[key.to_s] = value
      end
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
