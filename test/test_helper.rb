require 'test/unit'
require 'shoulda'
require 'mocha'
require 'webmock/test_unit'
require 'savon'
include WebMock::API

Savon.configure do |config| 
  config.log = false
  HTTPI.log = false
end