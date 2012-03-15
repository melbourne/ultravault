require 'test/unit'
require 'shoulda'
require 'mocha'
require_relative '../../../../lib/ultravault/recovery_point'

class ClientTest < Test::Unit::TestCase
  
  context "creating a recovery point" do
    
    setup do
      @input = { agentID: 'e9bd701b-dac1-4921-ab1c-467f35209e21',
                 createdOnTimestampInMillis: 1330361712361,
                 diskSafeID: '3067f030-9814-4314-ae03-75933ac29e37',
                 recoveryPointID: 1,
                 recoveryPointState: 'AVAILABLE'}
    end
    
    context '#agent_id' do
      should "match the input agent id" do

      end
    end
    
  end
  
end