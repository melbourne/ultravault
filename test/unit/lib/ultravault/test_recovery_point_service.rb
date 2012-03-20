require_relative '../../../test_helper'

class RecoveryPointServiceTest < Test::Unit::TestCase
  
  context 'a new recovery point service' do
    
    setup do
      @return =   [
                    {:agent_id=>"e9bd701b-dac1-4921-ab1c-467f35209e21",
                     :created_on_timestamp_in_millis=>"1330361712361",
                     :disk_safe_id=>"3067f030-9814-4314-ae03-75933ac29e37",
                     :recovery_point_id=>"1",
                     :recovery_point_state=>"AVAILABLE"},
                    {:agent_id=>"e9bd701b-dac1-4921-ab1c-467f35209e21",
                     :created_on_timestamp_in_millis=>"1330427016495",
                     :disk_safe_id=>"3067f030-9814-4314-ae03-75933ac29e37",
                     :recovery_point_id=>"2",
                     :recovery_point_state=>"AVAILABLE"}
                  ]
      
      @response = {
                    :get_recovery_points_response=>
                     {
                       :return=> @return,
                       :"@xmlns:ns1"=>"http://recoverypoints.api.server.backup.r1soft.com/"
                     }
                   }       
    end

    context '#find_recovery_points_by_disk_safe_id' do
      setup do
        UltraVault::RecoveryPointService.expects(:api_request).returns(stub(endpoint: 'foo',
            namespace: 'bar'))
        @client = stub
        UltraVault::RecoveryPointService.expects(:client).returns(@client)
      end
      should "return recovery point objects if present" do
        @client.expects(:request).with(
          :getRecoveryPoints, diskSafe: { id: 'foo' },
            includeMerged: false).returns(mock(to_hash: @response))
        recovery_points = UltraVault::RecoveryPointService.find_recovery_points_by_disk_safe_id('foo')
      end
      
      should "raise an error if there are no recovery points" do
        error = Savon::SOAP::Fault.new(stub(body: 'foo'))
        @client.expects(:request).with(
          :getRecoveryPoints, diskSafe: { id: 'bar' },
            includeMerged: false).raises(error)
        assert_raise Savon::SOAP::Fault do
          recovery_points = UltraVault::RecoveryPointService.find_recovery_points_by_disk_safe_id('bar')
        end
      end
    end
    
    context "#extract_recovery_point_params" do
      should "drill down into the hash" do
        assert_equal UltraVault::RecoveryPointService.send(
          :extract_recovery_point_params, @response),
          @return
      end
    end
  end
  
end