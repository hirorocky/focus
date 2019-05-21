source 'https://rubygems.org'

gem 'rails',                   '5.2.2'
gem 'puma'
gem 'bcrypt',                  '3.1.12'
# gem 'bootstrap',               '~> 4.1.1'
gem 'jquery-rails'
gem 'turbolinks'
gem 'sass-rails'
gem 'uglifier'
gem 'jbuilder'
gem 'will_paginate',           '3.1.7'
# gem 'bootstrap-will_paginate'
gem 'bootsnap', require: false
gem "bulma-rails", ">=0.7.4"
gem 'will_paginate-bulma'
gem 'gon'
gem 'ffi', '1.11.1'

group :development, :test do
  gem 'rails-i18n', '~> 5.1'
  gem 'sqlite3', '1.3.13'
  gem 'mail-iso-2022-jp' # 日本語のメールを送るためのgem
  gem 'byebug',  '9.0.6', platform: :mri
  gem 'factory_bot_rails', '~> 4.11'
end

group :development do
  gem 'listen'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'

  gem 'rspec-rails'
  gem 'webdrivers'
end

group :production do
  gem 'pg', '0.20.0'
  gem 'fog', '1.42'
end
