require 'test/unit'
require 'shoulda'
require 'mocha'
require_relative '../../../../lib/ultravault/recovery_point'

class RecoveryPointTest < Test::Unit::TestCase
  
  context "creating a recovery point" do
    
    setup do
      @input = { agentID: 'e9bd701b-dac1-4921-ab1c-467f35209e21',
                 createdOnTimestampInMillis: 1330361712361,
                 diskSafeID: '3067f030-9814-4314-ae03-75933ac29e37',
                 recoveryPointID: 1,
                 recoveryPointState: 'AVAILABLE'}
    end
    
    context '#agent_id' do
      
      setup do
        @recovery_point = UltraVault::RecoveryPoint.new(@input)
      end
      
      should "match the input agent id" do
        assert_equal @recovery_point.agent_id, @input[:agentID]
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
        assert_equal @recovery_point.disk_safe_id, @input[:diskSafeID]
      end
      
      should "match the recovery point ID" do
        assert_equal @recovery_point.id, @input[:recoveryPointID]
      end
      
      should "match the recovery point state" do
        assert_equal @recovery_point.state, @input[:recoveryPointState].downcase
      end
    end
    
  end
  
end