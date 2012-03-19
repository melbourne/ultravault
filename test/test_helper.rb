require 'test/unit'
require 'shoulda'
require 'mocha'
require 'webmock/test_unit'
require 'savon'
include WebMock::API
require_relative '../lib/ultravault'

Savon.configure do |config| 
  config.log = false
  HTTPI.log = false
end

UltraVault.configure do |config|
  config.host = 'foo.bar.baz'
  config.port = 9080
  config.api_version = 1
  config.ssl = false
  config.username = 'foo'
  config.password = 'bar'
end