require_relative '../test_helper'
require_relative '../../lib/ultravault'
require_relative './stubs'

class ClientCodeTest < Test::Unit::TestCase

  context "typical usage" do            
    
    should "retrieve agents, disksafes and recovery points" do
      # Set up the service
      UltraVault.configure do |config|
        config.host = 'foo.bar.baz'
        config.port = 9080
        config.api_version = 1
        config.ssl = false
        config.username = 'foo'
        config.password = 'bar'
      end
      # Create an agent
      agent_service = UltraVault::AgentService.new
      agent = agent_service.find_agent_by_id("e9bd701b-dac1-4921-ab1c-467f35209e21")
      assert_not_nil agent
      disksafes = agent.disk_safes
      assert disksafes.count > 0
    end
  end
end