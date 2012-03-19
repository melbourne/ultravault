require_relative '../../../test_helper'

class AgentServiceTest < Test::Unit::TestCase
  
  context 'a new agent service' do
    
    setup do
      @return =   { :database_add_on_enabled=>false,
                      :description=>"test-MSSQL",
                      :hostname=>"46.20.232.228",
                      :id=>"e9bd701b-dac1-4921-ab1c-467f35209e21",
                      :os_type=>"WINDOWS", :port_number=>"1167"
                  }
      
      @response = {:get_agent_by_id_response=>
                     {:return=> @return,
                       :"@xmlns:ns1"=>"http://agent.api.server.backup.r1soft.com/"
                     }
                   }         
    end
    
    context '#initialize' do
      should "pass on init params to the client" do
        UltraVault::Client.expects(:new)
        UltraVault::AgentService.new
      end
      
      should "pass on the params to the api request" do
        UltraVault::ApiRequest.expects(:new).returns(mock(endpoint: 'foo',
          namespace: 'bar'))
        UltraVault::AgentService.new      
      end
    end
    
    context '#find_agent_by_id' do
      setup do
        @agent_service = UltraVault::AgentService.new
      end
      
      should "return an agent object if it exists" do
        UltraVault::Client.any_instance.expects(:request).with(
          :getAgentByID, id: 'foo').returns(mock(to_hash: @response))
        UltraVault::Client.any_instance.expects(:request).with(
              :getDiskSafesForAgent, agent: { id: 'e9bd701b-dac1-4921-ab1c-467f35209e21'}
              ).returns(stub_everything)
        agent = @agent_service.find_agent_by_id('foo')
        assert agent.is_a? UltraVault::Agent
      end
      
      should "raise an error if it does not exist" do
        error = Savon::SOAP::Fault.new(stub(body: 'foo'))
        UltraVault::Client.any_instance.expects(:request).with(
          :getAgentByID, id: 'bar').raises(error)
        assert_raise Savon::SOAP::Fault do
          agent = @agent_service.find_agent_by_id('bar')
        end
      end
    end
    
    context "#extract_agent_params" do
      should "drill down into the hash" do
        agent_service = UltraVault::AgentService.new
        assert_equal agent_service.send(:extract_agent_params, @response),
          @return
      end
    end
  end
  
end