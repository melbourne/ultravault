require_relative '../../../test_helper'

class RecoveryPointServiceTest < Test::Unit::TestCase
  
  context 'a new recovery point service' do
    
    setup do
      @return =   { 
                  }
      
      @response = {
                    :get_FOO_response=>
                     {
                       :return=> @return,
                       :"@xmlns:ns1"=>"http://recoverypoint.api.server.backup.r1soft.com/"
                     }
                   }         
    end
    
    context '#initialize' do
      should "pass on init params to the client" do
        UltraVault::Client.expects(:new)
        UltraVault::RecoveryPointService.new
      end
      
      should "pass on the params to the api request" do
        UltraVault::ApiRequest.expects(:new).returns(
        mock(endpoint: 'foo', namespace: 'bar'))
        UltraVault::RecoveryPointService.new      
      end
    end
    
    context '#find_FOO' do
      setup do
        @recovery_point_service = UltraVault::RecoveryPointService.new
      end
      
      should "return a recovery point objects if present" do
        UltraVault::Client.any_instance.expects(:request).with(
          :getFOO, id: 'foo').returns(mock(to_hash: @response))
        agent = @recover_point_service.find_FOO('foo')
      end
      
      should "raise an error if there are no recovery points" do
        error = Savon::SOAP::Fault.new(stub(body: 'foo'))
        UltraVault::Client.any_instance.expects(:request).with(
          :getFOO, id: 'bar').raises(error)
        assert_raise Savon::SOAP::Fault do
          agent = @recovery_point_service.find_agent_by_id('bar')
        end
      end
    end
    
    context "#extract_recovery_point_params" do
      should "drill down into the hash" do
        recovery_point_service = UltraVault::RecoveryPointService.new
        assert_equal recovery_point_service.send(
          :extract_recovery_point_params, @response),
          @return
      end
    end
  end
  
end