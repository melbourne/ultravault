require_relative '../../../../../test_helper'

module UltraVault::V1
  class PolicyServiceTest < Test::Unit::TestCase
  
    context 'a new policy service' do
    
      setup do
        load_policy_service_fixtures
      end
    
      context 'public methods' do
      
        setup do
          UltraVault::ApiRequest.expects(:new).returns(stub(endpoint: 'foo',
              namespace: 'bar'))
          @service = PolicyService.new
          @client = stub
          @service.expects(:client).returns(@client)
          @error = Savon::SOAP::Fault.new(stub(body: 'foo'))
        end
      
        context '#find_policy_by_id' do
          should "return a policy object if it exists" do
            @client.expects(:request).with(
              :getPolicyById, id: 'foo').returns(mock(to_hash: @policy_by_id_wrapper))
            Policy.expects(:new).returns(stub_everything)
            policy = @service.find_policy_by_id('foo')
          end
      
          should "raise an error if it does not exist" do
            @client.expects(:request).with(
              :getPolicyById, id: 'bar').raises(@error)
            assert_raise Savon::SOAP::Fault do
              policy = @service.find_policy_by_id('bar')
            end
          end
        end
    
        context '#all_policies' do
          should "return all policies available" do
            @client.expects(:request).with(:getPolicies).returns(
              mock(to_hash: @all_policies_wrapper)) 
            Policy.expects(:new).at_least_once.returns(stub_everything)
            policies = @service.all_policies
          end
        
          should "raise an error if something goes wrong" do
            @client.expects(:request).with(:getPolicies).raises(@error)
            assert_raise Savon::SOAP::Fault do
              agent = @service.all_policies
            end
          end
        end

      end

    end

  end
end
