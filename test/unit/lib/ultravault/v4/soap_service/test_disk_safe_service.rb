require_relative '../../../../../test_helper'

module UltraVault::V4
  class DiskSafeServiceTest < Test::Unit::TestCase

    context 'a new disk safe service' do

       setup do
         load_disk_safe_service_fixtures
       end

       context '#find_disksafes_by_agent_id' do
         setup do
           UltraVault::ApiRequest.stubs(:new).returns(stub(endpoint: 'foo',
               namespace: 'bar'))
           @service = UltraVault::V4::DiskSafeService.new
           @client = stub
           @service.stubs(:client).returns(@client)
         end
       
         should "return an array of disksafe objects if there are any" do
           @client.expects(:request).with(
                 :getDiskSafes).returns(mock(to_hash: @all_disk_safes_wrapper))
           disk_safes = @service.find_disksafes_by_agent_id('e9bd701b-dac1-4921-ab1c-467f35209e21')
           assert_equal 1, disk_safes.count
           assert disk_safes.each {|ds| ds.is_a? UltraVault::V1::DiskSafe }
         end

         should "raise an error if it does not exist" do
         
         end
       end
     end
  end
end
