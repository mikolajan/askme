source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.0.3', '>= 6.0.3.3'
gem 'puma', '~> 4.1'

gem 'webpacker', '~> 4.0'
gem 'bootsnap', require: false

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'byebug'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.1.5'
end
