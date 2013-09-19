require "rspec"
require "pry-debugger"
require "capuchin"
require "tempfile"
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.default_cassette_options = { :record => :new_episodes }
  config.configure_rspec_metadata!

  config.filter_sensitive_data("<API_KEY>") { ENV['MAILCHIMP_API_KEY'] }
end

RSpec.configure do |config|
  config.order = 'random'
end
