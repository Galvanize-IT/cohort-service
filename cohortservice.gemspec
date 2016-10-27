$:.push File.expand_path("../lib", __FILE__)

# # Maintain your gem's version:
require "cohortservice/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cohortservice"
  s.version     = Cohortservice::VERSION
  s.authors     = ["Derik Linch"]
  s.email       = ["dev@galvanize.com"]
  s.homepage    = "http://www.galvanize.com"
  s.summary     = "Source of truth for all your Galvanize cohort or campus woes."
  s.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  s.files       = Dir["{lib}/**/*"] + ["MIT.LICENSE", "README.md"]

  s.add_development_dependency "bundler", "~> 1.12"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"
end
