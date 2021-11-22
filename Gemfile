source 'https://rubygems.org'

ruby '3.0.2'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

group :test do
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rspec'
  gem 'rubocop'
end
