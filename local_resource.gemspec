$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem"s version:
require "local_resource/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name          = "local_resource"
  s.version       = LocalResource::VERSION
  s.authors       = ["Platanus", "Leandro Segovia"]
  s.email         = ["rubygems@platan.us", "ldlsegovia@gmail.com"]
  s.homepage      = "https://github.com/platanus/local_resource"
  s.summary       = "Engine to treat external resources as if they were local"
  s.description   = "Rails engine to treat external resources as if they were local"
  s.license       = "MIT"

  s.files = `git ls-files`.split($/).reject { |fn| fn.start_with? "spec" }
  s.bindir = "exe"
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", ">= 6.0"
  s.add_dependency "open_uri_redirections"

  s.add_development_dependency "coveralls"
  s.add_development_dependency "factory_bot_rails"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rspec_junit_formatter"
  s.add_development_dependency "rubocop", "0.65.0"
  s.add_development_dependency "rubocop-rspec"
  s.add_development_dependency "sqlite3", "~> 1.4.2"
end
