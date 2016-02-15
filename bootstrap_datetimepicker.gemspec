$:.push File.expand_path("../lib", __FILE__)

require "bootstrap_datetimepicker/version"

Gem::Specification.new do |s|
  s.name        = "bootstrap_datetimepicker"
  s.version     = BootstrapDatetimepicker::VERSION
  s.authors     = ["Gary Foster", "Stephen McIntosh", "Eric Bundy"]
  s.email       = ["garyfoster@radicalbear.com"]
  s.homepage    = "https://github.com/radicalbear/bootstrap_datetimepicker"
  s.license     = "MIT"
  s.summary     = "Date and time pickers for Rails, compatible with simple form"
  s.description = "Date and time pickers for Rails, compatible with simple form. A front end component to allow the user to select a date, a time or a date/time which can be used in a form to update a model or to just gather user input. Regardless of using a date, a time or a date/time combo, the resulting value will update one model datetime attribute without having to configure anything at the controller or model level. The selector style is optimized for Twitter Bootstrap."

  s.files = Dir["{lib,vendor/**/*"] + ["MIT-LICENSE", "README.md"]

  s.add_dependency('momentjs-rails', '>= 2.9.0')
end
