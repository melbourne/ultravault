module UltraVault
  module Fixtures
    def load_recovery_point_service_fixtures
      @recovery_points_by_disk_safe_id =   [
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
      
      @recovery_points_by_disk_safe_id_wrapper = {
                    :get_recovery_points_response=>
                     {
                       :return=> @recovery_points_by_disk_safe_id,
                       :"@xmlns:ns1"=>"http://recoverypoints.api.server.backup.r1soft.com/"
                     }
                   }
    end
  end
end