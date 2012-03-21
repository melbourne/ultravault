require_relative '../../../test_helper'

class RecoveryPointServiceTest < Test::Unit::TestCase
  
  context 'a new recovery point service' do
    
    setup do
      load_recovery_point_service_fixtures
    end

    context '#find_recovery_points_by_disk_safe_id' do
      setup do
        UltraVault::ApiRequest.expects(:new).returns(stub(endpoint: 'foo',
            namespace: 'bar'))
        @service = UltraVault::RecoveryPointService.new
        @client = stub
        @service.expects(:client).returns(@client)
      end
      should "return recovery point objects if present" do
        @client.expects(:request).with(
          :getRecoveryPoints, diskSafe: { id: 'foo' },
            includeMerged: false).returns(mock(to_hash: @recovery_points_by_disk_safe_id_wrapper))
        recovery_points = @service.find_recovery_points_by_disk_safe_id('foo')
      end
      
      should "raise an error if there are no recovery points" do
        error = Savon::SOAP::Fault.new(stub(body: 'foo'))
        @client.expects(:request).with(
          :getRecoveryPoints, diskSafe: { id: 'bar' },
            includeMerged: false).raises(error)
        assert_raise Savon::SOAP::Fault do
          recovery_points = @service.find_recovery_points_by_disk_safe_id('bar')
        end
      end
    end
    
    context "#extract_recovery_point_params" do
      should "drill down into the hash" do
        assert_equal UltraVault::RecoveryPointService.new.send(
          :extract_recovery_point_params, @recovery_points_by_disk_safe_id_wrapper),
          @recovery_points_by_disk_safe_id
      end
    end
  end
  
end