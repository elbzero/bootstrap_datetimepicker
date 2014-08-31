$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bootstrap_datetimepicker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bootstrap_datetimepicker"
  s.version     = BootstrapDatetimepicker::VERSION
  s.authors     = ["Gary Foster"]
  s.email       = ["garyfoster@radicalbear.com"]
  s.homepage    = "http://www.radicalbear.com/"
  s.summary     = "Date and time pickers for Rails, compatible with simple form"
  s.description = "todo"

  s.files = Dir["{lib,vendor/**/*"] + ["MIT-LICENSE", "README.md"]
end
