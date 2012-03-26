require_relative '../../../test_helper'

module UltraVault
  class SoapServiceTest < Test::Unit::TestCase
  
    context "#initialize" do
      should "pass off the right actions" do
        ApiRequest.expects(:new).returns(stub_everything)
        Client.expects(:new)
        @service = SoapService.new(:Agent)
      end
    end
  
    context 'a new soap service' do
    
      setup do
        @service = SoapService.new(:Agent)
        load_agent_service_fixtures
      end
    
      context "#client" do
        @service.respond_to? :client
      end
    
      context "#extract_params" do
        should "drill into the hash and unwrap it" do
          assert_equal @service.send(:extract_params,
            @agent_by_id_wrapper, :get_agent_by_id_response),
            @agent_by_id
        end
      end

      context "#extract_params_array" do
        should "drill into the hash and unwrap into an array" do
          assert_equal @service.send(:extract_params_array,
            @all_agents_wrapper, :get_agents_response), @all_agents
        end
      end
    end
  end
end