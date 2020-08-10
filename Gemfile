source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

gem "rails", github: "rails/rails", branch: "6-0-stable"

# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 4.1"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Use development version of Webpacker
gem "webpacker", github: "rails/webpacker"

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
#
gem "stimulus_reflex", "~> 3.2"
gem "view_component", "~> 2.18"
gem "devise", "~> 4.7"
gem "pagy", "~> 3.8"
gem "pundit", "~> 2.1"

# Notifications
gem "noticed"

# Customer Service
gem "blazer", "~> 2.2"

# Security
gem "lockbox", "~> 0.4.6"

gem "sidekiq", "~> 6.1"

# Searching
gem "groupdate", "~> 5.1"
gem "blind_index", "~> 2.1"
gem "searchkick", "~> 4.4"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

# Admin stuff
gem "administrate"

# Feature Flags
gem "rollout"

gem "rolify"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "break"
  gem "factory_bot_rails"
  gem "faker"
  gem "dotenv-rails"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", github: "rails/web-console"
  gem "listen", "~> 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "standard"
  gem "letter_opener_web", "~> 1.0"
end

group :test do
  gem "capybara"
  gem "cuprite"
  gem "rspec-rails"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
