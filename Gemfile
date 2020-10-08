source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.3'
gem 'mysql2', '>= 0.4.4'
gem 'puma', '~> 4.3'
gem 'jbuilder', '~> 2.10'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'ridgepole'
gem 'slim-rails'
gem 'active_decorator'
gem 'bcrypt'
gem 'graphql'
gem 'graphql-batch'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'rspec-rails'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'factory_bot_rails'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.3'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop'
  gem 'graphiql-rails'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'rspec-json_matcher'
  gem 'rspec_junit_formatter'
  gem 'rails-controller-testing'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'graphiql-rails', group: :development