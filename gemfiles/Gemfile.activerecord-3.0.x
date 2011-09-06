source :rubygems

gem 'parameterize', :path => File.expand_path('../..', __FILE__)

gem 'activerecord',  '~> 3.0.0'
gem 'activesupport', '~> 3.0.0'

group :development do
  gem 'rake',         '>= 0.8.7'
  gem 'rspec',        '~> 2.6.0'
  gem 'sqlite3-ruby', '~> 1.3.3'
end
