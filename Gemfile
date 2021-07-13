source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'
gem 'mini_racer', platforms: :ruby

gem 'bootstrap'
gem 'dotenv-rails'
gem 'draper'
gem 'enum_help'
gem 'exception_notification'
gem 'font-awesome-sass'
gem 'gon'
gem 'html2slim'
gem 'kaminari'
gem 'line-bot-api'
gem 'meta-tags'
gem 'rails-i18n'
gem 'seed-fu'
gem 'slack-notifier'
gem 'slim-rails'
gem 'whenever', require: false

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.2', '>= 6.1.2.1'
# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.5'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem "factory_bot_rails"
  gem "rspec-rails"
end

group :test do
  gem 'capybara'
  gem 'webdrivers'

  gem 'shoulda-matchers'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec'

  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'

  gem 'capistrano'
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-puma', github: "seuros/capistrano-puma"
  gem 'capistrano-nginx'
  gem 'capistrano-yarn'
  gem 'capistrano-rails-console'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
