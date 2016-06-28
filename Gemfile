source 'https://rubygems.org'

gem 'rails', '4.2.6'
gem 'sqlite3' # the database for ActiveRecord
gem 'sass-rails', '~> 5.0' # SCSS for stylesheets
gem 'uglifier', '>= 1.3.0' # compressor for JavaScript assets
gem 'coffee-rails', '~> 4.1.0' # for .coffee assets and views
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0' # build JSON APIs
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'devise' # for authentication

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'capybara'
  gem 'factory_girl_rails'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'guard-rspec', require: false

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
