require_relative '../../../../../test_helper'

module UltraVault::V1
  class DiskSafeServiceTest < Test::Unit::TestCase

    context 'a new disk safe service' do

       setup do
         load_disk_safe_service_fixtures
       end

       context '#find_disksafes_by_agent_id' do
         setup do
           UltraVault::ApiRequest.expects(:new).returns(stub(endpoint: 'foo',
               namespace: 'bar'))
           @service = UltraVault::V1::DiskSafeService.new
           @client = stub
           @service.expects(:client).returns(@client)
         end
       
         should "return an array of disksafe objects if there are any" do
           @client.expects(:request).with(
                 :getDiskSafesForAgent, agent: { id: 'foo' }).returns(mock(to_hash: @disk_safes_by_agent_id_wrapper))
           UltraVault::V1::DiskSafe.expects(:new).returns(stub)
           disk_safes = @service.find_disksafes_by_agent_id('foo')
           assert disk_safes.each {|ds| ds.is_a? UltraVault::V1::DiskSafe }
         end

         should "raise an error if it does not exist" do
           error = Savon::SOAP::Fault.new(stub(body: 'foo'))
          @client.expects(:request).with(
              :getDiskSafesForAgent, agent: { id: 'bar' }).raises(error)
           assert_raise Savon::SOAP::Fault do
             disk_safes = @service.find_disksafes_by_agent_id('bar')
           end
         end
       end
     end
  end
end
