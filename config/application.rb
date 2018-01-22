require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module App
  class Application < Rails::Application
    # config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    I18n.enforce_available_locales = true
  end
end