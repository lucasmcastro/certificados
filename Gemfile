source 'https://rubygems.org'

gem 'rails'
gem 'sqlite3'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier'
end

gem "less-rails"
gem "twitter-bootstrap-rails"
gem 'jquery-rails'
gem 'unicorn'
gem 'uuid', '~> 2.3.5'
gem 'pdfkit', '~> 0.5.2'
gem 'sidekiq'
gem 'xml-simple'
gem 'pry-rails', :group => :development
gem 'figaro'

group :development, :test do
  gem "rails_best_practices"
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'terminal-notifier-guard' 
  gem 'guard'
  gem 'guard-rspec'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'launchy'
end