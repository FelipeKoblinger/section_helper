$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'active_model'
require 'action_controller'
require 'action_view'

require 'section_helper'

require 'rspec-html-matchers'

RSpec.configure do |config|
  config.include RSpecHtmlMatchers
end
