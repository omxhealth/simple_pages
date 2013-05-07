$:.push File.expand_path("../lib", __FILE__)
require "simple_pages/version"

Gem::Specification.new do |s|
  s.name        = "simple_pages"
  s.version     = SimplePages::VERSION
  s.authors     = ["Bruno Azisaka Maciel"]
  s.email       = ["bruno@azisaka.com.br"]
  s.homepage    = "https://github.com/azisaka/simple_pages"
  s.summary     = "A dummy plugin did for easy static page maintenance."
  s.description = "A dummy plugin did for easy static page maintenance."

  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rr"
end
