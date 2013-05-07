ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

Rails.backtrace_cleaner.remove_silencers!

require 'rspec'
require 'rspec/rails'
require 'rr'

RSpec::Matchers.define :be_not_found do
  match do |actual|
    actual.code == "404"
  end

  failure_message_for_should do |actual|
    "Expected #{actual.class} page to be not found but the status was #{actual.code}"
  end
end

RSpec.configure do |config|
  config.mock_with :rr
end
