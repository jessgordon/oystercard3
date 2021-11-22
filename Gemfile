# frozen_string_literal: true

source "https://rubygems.org"

ruby '3.0.2'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

group :test do
  gem 'rspec'
  gem 'simplecov'
end
   

group :development, :test do
  gem 'rubocop'
end

# gem "rails"
