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
      
      @response = {
                    :get_agent_by_id_response=>
                     {
                       :return=> @return,
                       :"@xmlns:ns1"=>"http://agent.api.server.backup.r1soft.com/"
                     }
                   }       
    end
    
    context '#find_agent_by_id' do
      setup do
        UltraVault::ApiRequest.expects(:new).returns(stub(endpoint: 'foo',
            namespace: 'bar'))
        @service = UltraVault::AgentService.new
        @client = stub
        @service.expects(:client).returns(@client)
      end
      
      should "return an agent object if it exists" do
        @client.expects(:request).with(
          :getAgentByID, id: 'foo').returns(mock(to_hash: @response))
        UltraVault::Agent.expects(:new).returns(stub_everything)
        agent = @service.find_agent_by_id('foo')
      end
      
      should "raise an error if it does not exist" do
        error = Savon::SOAP::Fault.new(stub(body: 'foo'))
        @client.expects(:request).with(
          :getAgentByID, id: 'bar').raises(error)
        assert_raise Savon::SOAP::Fault do
          agent = @service.find_agent_by_id('bar')
        end
      end
    end
    
    context "#extract_agent_params" do
      should "drill down into the hash" do
        assert_equal UltraVault::AgentService.new.send(:extract_agent_params, @response),
          @return
      end
    end
  end
  
end