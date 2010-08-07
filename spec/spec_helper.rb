require 'rubygems'
require 'spork'

ENV["RAILS_ENV"] ||= 'test'

Spork.prefork do
  require File.expand_path(File.dirname(__FILE__) + "/rails/config/environment")

  require 'spec'
  require 'spec/rails'
  require 'rr'

  require File.join(File.dirname(__FILE__), '..', 'init')

  module SimplePages
    module Matchers
      def be_not_found
        ::Spec::Matchers::Matcher.new :be_not_found do
          match do |actual|
            actual.code == "404"
          end

          failure_message_for_should do |actual|
            "Expected #{actual.class} page to be not found but the status was #{actual.code}"
          end
        end
      end
    end
  end

  Spec::Runner.configure do |config| 
    config.include(SimplePages::Matchers)
    config.mock_with :rr
  end
end