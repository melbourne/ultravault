require_relative '../../../test_helper'
require_relative '../../../../lib/ultravault/recovery_point'

class RecoveryPointTest < Test::Unit::TestCase
  
  context "creating a recovery point" do
    
    setup do
      @input = { agent_id: 'e9bd701b-dac1-4921-ab1c-467f35209e21',
                 created_on_timestamp_in_millis: 1330361712361,
                 disk_safe_id: '3067f030-9814-4314-ae03-75933ac29e37',
                 recovery_point_id: 1,
                 recovery_point_state: 'AVAILABLE'}
    end
    
    context 'attributes' do
      
      setup do
        @recovery_point = UltraVault::RecoveryPoint.new(@input)
      end
      
      should "match the input agent id" do
        assert_equal @recovery_point.agent_id, @input[:agent_id]
      end
      
      should "give the created_at as a ruby date_time" do
        assert_equal @recovery_point.created_at.year, 2012
        assert_equal @recovery_point.created_at.month, 02
        assert_equal @recovery_point.created_at.day, 27
        assert_equal @recovery_point.created_at.hour, 16
        assert_equal @recovery_point.created_at.min, 55
        assert_equal @recovery_point.created_at.sec, 12
      end
      
      should "match the disk safe id" do
        assert_equal @recovery_point.disk_safe_id, @input[:disk_safe_id]
      end
      
      should "match the recovery point ID" do
        assert_equal @recovery_point.id, @input[:recovery_point_id]
      end
      
      should "match the recovery point state" do
        assert_equal @recovery_point.state, @input[:recovery_point_state].downcase
      end
    end
    
  end
  
end