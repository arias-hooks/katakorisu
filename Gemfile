source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'
gem 'mini_racer', platforms: :ruby

# slim
gem 'html2slim'
gem 'slim-rails'
# kaminariにbootstrapを適用するためだけに利用
gem 'bootstrap'
# Font Awesome
gem 'font-awesome-sass'
# 環境変数の管理
gem 'dotenv-rails'
# 国際化
gem 'rails-i18n'
# enumの国際化
gem 'enum_help'
# RailsとJSを連携。JSへの環境変数の直書きを防ぐために利用。
gem 'gon'
# ページネーション
gem 'kaminari'
# 初期データを入れる。同じデータが登録されるのを防ぐために利用。
gem 'seed-fu'
# LINEプッシュ通知
gem 'line-bot-api'
# 定時バッチ処理
gem 'whenever', require: false
# メタタグ
gem 'meta-tags'
# エラー通知
gem 'exception_notification'
gem 'slack-notifier'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1', '>= 6.1.4'
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
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Debugger
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'

  # Test
  gem "factory_bot_rails"
  gem "rspec-rails"
end

group :test do
  gem 'capybara'
  gem 'webdrivers'
  # マッチャのコレクション。enumのテストコードを書くために利用。
  gem 'shoulda-matchers'
  # カバレッジの計測
  gem 'simplecov', require: false
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

  # コード解析
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false

  # 自動デプロイ
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
