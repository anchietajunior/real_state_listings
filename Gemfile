source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"
gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "pg"
gem "puma", "~> 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
# Gem to organize Services
gem "interactor", "~> 3.0"
# Gem to make http requests
gem "httparty"
# Styles
gem "tailwindcss-rails", "~> 2.0"
# Pagination
gem "pagy"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
end

group :test do
  gem "shoulda-matchers", "~> 5.0"
  gem "vcr"
  gem "webmock", "~> 3.14.0"
  gem "simplecov", require: false
  gem "database_cleaner-active_record"
end

group :development do
  gem "web-console"
end

