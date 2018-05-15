source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bootstrap'
gem 'jquery-rails'
gem 'puma'
gem 'rails', '~> 5.2.0'
gem 'sass-rails'
gem 'sqlite3'
gem 'uglifier'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false

group :test, :development do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'geckodriver-helper'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'ruby_css_lint'
  gem 'shoulda-matchers'
  gem 'simplecov'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end
