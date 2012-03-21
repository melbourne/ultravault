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
        config.debug = false
      end   
     
      # Get all agents
      agents = UltraVault::Agent.all
      assert agents.count > 0
      
      # Get an agent
      agent = UltraVault::Agent.find_by_id("e9bd701b-dac1-4921-ab1c-467f35209e21")
      assert_not_nil agent
      
      # Check disksafes
      assert agent.disk_safes.count > 0
                                        
      # Check recovery points
      disk_safe = agent.disk_safes.first
      assert disk_safe.recovery_points.count > 0
    end
  end
end