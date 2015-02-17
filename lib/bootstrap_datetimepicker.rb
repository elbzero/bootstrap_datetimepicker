require "bootstrap_datetimepicker/version"

module BootstrapDatetimepicker
  module Rails
    class Engine < ::Rails::Engine
      require 'momentjs-rails'
    end
  end
end