require 'simplecov'
SimpleCov.start

require 'test/unit'
require 'shoulda'
require 'mocha'
require 'webmock/test_unit'
require 'savon'
require 'ostruct'

include WebMock::API

require_relative '../lib/ultravault/api_request'
require_relative '../lib/ultravault/client'
require_relative '../lib/ultravault/config'
require_relative '../lib/ultravault/data_objects/agent'
require_relative '../lib/ultravault/data_objects/disk_safe'
require_relative '../lib/ultravault/data_objects/recovery_point'
require_relative '../lib/ultravault/soap_service'
require_relative '../lib/ultravault/soap_service/agent_service'
require_relative '../lib/ultravault/soap_service/disk_safe_service'
require_relative '../lib/ultravault/soap_service/recovery_point_service'
require_relative '../lib/ultravault/soap_service/policy_service'
require_relative '../lib/ultravault/data_objects/policy'

require_relative 'support/fixtures'

include UltraVault::Fixtures

UltraVault.configure do |config|
  config.host = 'foo.bar.baz'
  config.port = 9080
  config.api_version = 1
  config.ssl = false
  config.username = 'foo'
  config.password = 'bar'
end
