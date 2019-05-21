require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Src
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # 日本語設定（https://qiita.com/shi-ma-da/items/7e5c3d75c9a9f51abdd5）
    config.i18n.default_locale = :ja # デフォルトのlocaleを日本語(:ja)にする
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    config.generators do |g|
        g.test_framework :rspec,
          view_specs: false,      # 以下、必要に応じて任意にトグルする
          helper_specs: false,
          routing_specs: false,
          controller_specs: false,
          request_specs: true
    end

  end
end
