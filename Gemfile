source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'puma'
gem 'rails', '~> 5.2.0'
gem 'sass-rails'
gem 'sqlite3'
gem 'turbolinks', '~> 5'
gem 'uglifier'

group :test, :development do
  gem 'geckodriver-helper'
  gem 'ruby_css_lint'

  # Debugging Gems
  gem 'binding_of_caller'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-remote'

  # Auditing Gems
  gem 'rubocop'

  # Development Gems
  gem 'awesome_print'
  gem 'better_errors'
  gem 'bullet'
  gem 'factory_bot_rails'
  gem 'foreman'

  # Seeds
  gem 'faker'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'chromedriver-helper'
  gem 'database_cleaner'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov'
end
