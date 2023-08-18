# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in chargify_wrapper.gemspec
gemspec

gem "rake", "~> 13.0"

group :test do
  #Autoload dotenv in Rails.
  gem "dotenv-rails", "~> 2.8"

  #WebMock allows stubbing HTTP requests and setting expectations on HTTP requests.
  gem "webmock", "~> 3.18"

  #Record your test suite's HTTP interactions and replay them during future test runs for fast, deterministic, accurate tests.
  gem "vcr"
end