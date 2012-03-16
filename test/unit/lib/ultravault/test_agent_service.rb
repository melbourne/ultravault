require_relative '../../../test_helper'
require_relative '../../../../lib/ultravault/agent_service'

class AgentServiceTest < Test::Unit::TestCase
  
  context 'a new agent service' do
    
    setup do
      @params =  { host: 'foo.bar.baz', port: 9080, api_version: 1, ssl: false, username: 'foo', password: 'bar' }
    end
    
    should "pass on init params to the client" do
      UltraVault::Client.expects(:new)
      agent_service = UltraVault::AgentService.new @params
    end
    
    should "pass on a request to find an agent by id onto the client" do
      
    end
  end
end