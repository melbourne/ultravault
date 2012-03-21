require_relative '../../../test_helper'

class AgentServiceTest < Test::Unit::TestCase
  
  context 'a new agent service' do
    
    setup do
      load_agent_service_fixtures
    end
    
    context 'public methods' do
      
      setup do
        UltraVault::ApiRequest.expects(:new).returns(stub(endpoint: 'foo',
            namespace: 'bar'))
        @service = UltraVault::AgentService.new
        @client = stub
        @service.expects(:client).returns(@client)
        @error = Savon::SOAP::Fault.new(stub(body: 'foo'))
      end
      
      context '#find_agent_by_id' do
        should "return an agent object if it exists" do
          @client.expects(:request).with(
            :getAgentByID, id: 'foo').returns(mock(to_hash: @agent_by_id_wrapper))
          UltraVault::Agent.expects(:new).returns(stub_everything)
          agent = @service.find_agent_by_id('foo')
        end
      
        should "raise an error if it does not exist" do
          @client.expects(:request).with(
            :getAgentByID, id: 'bar').raises(@error)
          assert_raise Savon::SOAP::Fault do
            agent = @service.find_agent_by_id('bar')
          end
        end
      end
    
      context '#all_agents' do
        should "return all agents available" do
          @client.expects(:request).with(:getAgents).returns(
            mock(to_hash: @all_agents_wrapper)) 
          UltraVault::Agent.expects(:new).at_least_once.returns(stub_everything)
          agents = @service.all_agents         
        end
        
        should "raise an error if something goes wrong" do
          @client.expects(:request).with(:getAgents).raises(@error)
          assert_raise Savon::SOAP::Fault do
            agent = @service.all_agents
          end
        end
      end
    end
    
    context "#extract_agent_params" do
      should "drill down into the hash" do
        assert_equal UltraVault::AgentService.new.send(:extract_agent_params, @agent_by_id_wrapper),
          @agent_by_id
      end
    end
    
    context "#extract_all_agents_params" do
      should "drill down into the hash" do
        assert_equal UltraVault::AgentService.new.send(:extract_all_agents_params,
         @all_agents_wrapper), @all_agents
      end
    end
  end
  
end