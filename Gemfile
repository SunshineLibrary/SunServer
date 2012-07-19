# source 'http://rubygems.org'
source 'http://ruby.taobao.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'
#

gem 'paperclip', '~> 3.0'
gem 'jquery-rails'
gem 'therubyracer'
gem 'haml'
gem 'best_in_place'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "3.1.4"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

group :production do
  gem 'mysql2'
end

group :development do
  gem 'sqlite3'
  gem 'ruby-debug19', :require => 'ruby-debug'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'guard-rspec', '~> 0.4.4'               # auto run rspec upon file changes
  gem 'database_cleaner', '~> 0.6.7'          # cucumber rails needs this
  gem 'factory_girl_rails', :require => false # generate model during testing
  gem 'spork', '~> 0.9.0.rc9'                 # preload fixed rails resouces
end

group :test, :development do
  gem "rspec-rails", "~> 2.0"
end

