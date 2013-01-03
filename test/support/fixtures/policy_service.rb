module UltraVault
  module Fixtures
    def load_policy_service_fixtures
      @policy_by_id =   { :description=>nil,
                          :disk_safe_id=>"d1da6e8c-392f-4918-b780-6e5a5d62dd39",
                          :enabled=>true,
                          :force_full_block_scan=>false,
                          :frequency_type=>"DAILY",
                          :frequency_values=>{:hours_of_day=>"4", :starting_minute=>"0"},
                          :id=>"04071ece-4129-4623-b008-05d9b9a67a32",
                          :name=>"melbourne-kickstart",
                          :recovery_point_limit=>"10",
                          :state=>"OK"
                      }
      
      @policy_by_id_wrapper = {
                    :get_policy_by_id_response=>
                     {
                       :return=> @policy_by_id,
                       :"@xmlns:ns1"=>"http://policy.api.server.backup.r1soft.com/"
                     }
                   }

      @all_policies = [
                      {   :description=>nil,
                          :disk_safe_id=>"d1da6e8c-392f-4918-b780-6e5a5d62dd39",
                          :enabled=>true,
                          :force_full_block_scan=>false,
                          :frequency_type=>"DAILY",
                          :frequency_values=>{:hours_of_day=>"4", :starting_minute=>"0"},
                          :id=>"04071ece-4129-4623-b008-05d9b9a67a32",
                          :name=>"melbourne-kickstart",
                          :recovery_point_limit=>"10",
                          :state=>"OK"
                      },
                      {   :description=>nil,
                          :disk_safe_id=>"d1da6e8c-392f-4918-b780-6e5a5d62dd39",
                          :enabled=>true,
                          :force_full_block_scan=>false,
                          :frequency_type=>"DAILY",
                          :frequency_values=>{:hours_of_day=>"4", :starting_minute=>"0"},
                          :id=>"d1da6e8c-4129-4623-b780-05d9b9a67a32",
                          :name=>"melbourne-kickstart2",
                          :recovery_point_limit=>"10",
                          :state=>"OK"
                      }
                    ]

      @all_policies_wrapper = {
                   :get_policies_response=>
                    {
                      :return=> @all_policies,
                      :"@xmlns:ns1"=>"http://policy.api.server.backup.r1soft.com/"
                    }
                  }
    end
  end
end
