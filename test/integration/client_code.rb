require_relative '../test_helper'
require_relative '../../lib/ultravault'
require_relative './stubs'

class ClientCodeTest < Test::Unit::TestCase

  context "typical usage" do            
    
    should "retrieve agents, disksafes and recovery points" do
      @params =  { host: 'foo.bar.baz', port: 9080,
                   api_version: 1, ssl: false,
                   username: 'foo', password: 'bar' }
      # Create an agent
      agent_service = UltraVault::AgentService.new(@params)
      agent = agent_service.find_agent_by_id("e9bd701b-dac1-4921-ab1c-467f35209e21")
      assert_not_nil agent
    end
  end
end