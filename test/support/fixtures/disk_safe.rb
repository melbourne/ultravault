module UltraVault
  module Fixtures
    def load_disk_safe_fixtures
      @disk_safe_params = {:agent_id=>"e9bd701b-dac1-4921-ab1c-467f35209e21",
                :compression_level=>"LOW", 
                :compression_type=>"QUICKLZ", 
                :description=>"test-MSSQL", 
                :device_count=>"2", 
                :device_list=>{
                  :capacity=>"64421359616", 
                  :device_content_type=>"NTFS", 
                  :device_path=>"\\\\?\\Volume{1b1cac04-b25f-11e0-bc49-806e6f6e6963}", 
                  :enabled=>true, 
                  :mount_point=>"C:\\", 
                  :mounted=>true}, 
                :disk_safe_attribute_map=>{:entry=>
                  [{:key=>"ARCHIVING_ENABLED", :value=>true},
                   {:key=>"FILE_EXCLUDES_ENABLED",  :value=>true}, 
                   {:key=>"QUOTA_TYPE",  :value=>"NONE"}, 
                   {:key=>"CONTROLPANELS_ENABLED",  :value=>true}, 
                   {:key=>"ARCHIVE_POINT_LIMIT", :value=>"-1"},
                   {:key=>"RECOVERY_POINT_LIMIT", :value=>"-1"}, 
                   {:key=>"SOFT_QUOTA_VALUE", :value=>"-1.0"}, 
                   {:key=>"REPLICATION_FREQUENCY_LIMIT", :value=>"NO_LIMIT"}, 
                   {:key=>"HARD_QUOTA_VALUE", :value=>"-1.0"}]
                   }, 
                :id=>"3067f030-9814-4314-ae03-75933ac29e37",
                :open=>true, 
                :recovery_point_count=>"2", 
                :size=>"20931331073", 
                :size_of_deltas_in_disk_safe=>"18665326744", 
                :volume_id=>"9b77052e-e1d3-4c51-a49a-51544fcb12e1"}      
    end
  end
end