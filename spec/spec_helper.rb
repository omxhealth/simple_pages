ENV["RAILS_ENV"] ||= 'test'

require File.expand_path(File.dirname(__FILE__) + "/rails/config/environment")

require 'spec'
require 'spec/rails'

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

Spec::Runner.configure { |config| config.include(SimplePages::Matchers) }