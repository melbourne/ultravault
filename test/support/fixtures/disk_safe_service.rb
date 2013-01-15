module UltraVault
  module Fixtures
    def load_disk_safe_service_fixtures
      @disk_safes_by_agent_id = {
                  :agent_id=>"e9bd701b-dac1-4921-ab1c-467f35209e21",
                  :backup_partition_table=>true,
                  :backup_unmounted_devices=>true, 
                  :bytes_on_disk=>"20931331073",
                  :compression_level=>"LOW",
                  :compression_type=>"QUICKLZ",
                  :deltas_in_disk_safe=>"6920703",
                  :description=>"test-MSSQL",
                  :device_backup_type=>"AUTO_ADD_DEVICES",
                  :device_count=>"2",
                  :device_list=>{
                    :allocated_blocks=>"7843190",
                    :block_size=>"4096",
                    :capacity=>"64421359616",
                    :content_id=>"0004AFF104AFE7BC",
                    :device_content_type=>"NTFS",
                    :device_path=>"\\\\?\\Volume{1b1cac04-b25f-11e0-bc49-806e6f6e6963}",
                    :enabled=>true,
                    :mount_point=>"C:\\",
                    :mounted=>true,
                    :total_blocks=>"15727871"
                  },
                  :disk_safe_attribute_map=>{
                    :entry=>[
                      {:key=>"ARCHIVING_ENABLED", :value=>true},
                      {:key=>"FILE_EXCLUDES_ENABLED", :value=>true},
                      {:key=>"QUOTA_TYPE", :value=>"NONE"},
                      {:key=>"CONTROLPANELS_ENABLED", :value=>true},
                      {:key=>"ARCHIVE_POINT_LIMIT", :value=>"-1"},
                      {:key=>"RECOVERY_POINT_LIMIT", :value=>"-1"},
                      {:key=>"SOFT_QUOTA_VALUE", :value=>"-1.0"},
                      {:key=>"REPLICATION_FREQUENCY_LIMIT", :value=>"NO_LIMIT"},
                      {:key=>"HARD_QUOTA_VALUE", :value=>"-1.0"}
                     ]},
                   :id=>"3067f030-9814-4314-ae03-75933ac29e37",
                   :open=>true,
                   :path=>"/data/test-volume/3067f030-9814-4314-ae03-75933ac29e37",
                   :recovery_point_count=>"2",
                   :size=>"20931331073",
                   :size_of_deltas_in_disk_safe=>"18665326744",
                   :total_free_pages=>"0",
                   :total_free_pages_bytes=>"0",
                   :total_page_bytes=>"20924334080",
                   :total_page_count=>"638560",
                   :volume_id=>"9b77052e-e1d3-4c51-a49a-51544fcb12e1"
                 }

      @disk_safes_by_agent_id_wrapper = {
                    :get_disk_safes_for_agent_response=>{
                      :return=> @disk_safes_by_agent_id,
                      :"@xmlns:ns1"=>"http://disksafe.api.server.backup.r1soft.com/"
                     }
                   }

      @all_disk_safes = [
                {
                  :agent_id=>"e9bd701b-dac1-4921-ab1c-467f35209e21",
                  :backup_partition_table=>true,
                  :backup_unmounted_devices=>true, 
                  :bytes_on_disk=>"20931331073",
                  :compression_level=>"LOW",
                  :compression_type=>"QUICKLZ",
                  :deltas_in_disk_safe=>"6920703",
                  :description=>"test-MSSQL",
                  :device_backup_type=>"AUTO_ADD_DEVICES",
                  :device_count=>"2",
                  :device_list=>{
                    :allocated_blocks=>"7843190",
                    :block_size=>"4096",
                    :capacity=>"64421359616",
                    :content_id=>"0004AFF104AFE7BC",
                    :device_content_type=>"NTFS",
                    :device_path=>"\\\\?\\Volume{1b1cac04-b25f-11e0-bc49-806e6f6e6963}",
                    :enabled=>true,
                    :mount_point=>"C:\\",
                    :mounted=>true,
                    :total_blocks=>"15727871"
                  },
                  :disk_safe_attribute_map=>{
                    :entry=>[
                      {:key=>"ARCHIVING_ENABLED", :value=>true},
                      {:key=>"FILE_EXCLUDES_ENABLED", :value=>true},
                      {:key=>"QUOTA_TYPE", :value=>"NONE"},
                      {:key=>"CONTROLPANELS_ENABLED", :value=>true},
                      {:key=>"ARCHIVE_POINT_LIMIT", :value=>"-1"},
                      {:key=>"RECOVERY_POINT_LIMIT", :value=>"-1"},
                      {:key=>"SOFT_QUOTA_VALUE", :value=>"-1.0"},
                      {:key=>"REPLICATION_FREQUENCY_LIMIT", :value=>"NO_LIMIT"},
                      {:key=>"HARD_QUOTA_VALUE", :value=>"-1.0"}
                     ]},
                   :id=>"3067f030-9814-4314-ae03-75933ac29e37",
                   :open=>true,
                   :path=>"/data/test-volume/3067f030-9814-4314-ae03-75933ac29e37",
                   :recovery_point_count=>"2",
                   :size=>"20931331073",
                   :size_of_deltas_in_disk_safe=>"18665326744",
                   :total_free_pages=>"0",
                   :total_free_pages_bytes=>"0",
                   :total_page_bytes=>"20924334080",
                   :total_page_count=>"638560",
                   :volume_id=>"9b77052e-e1d3-4c51-a49a-51544fcb12e1"
                 },
                 {
                  :agent_id=>"e9bd701b-dac1-4921-2222-467f35209e21",
                  :backup_partition_table=>true,
                  :backup_unmounted_devices=>true, 
                  :bytes_on_disk=>"20931331073",
                  :compression_level=>"LOW",
                  :compression_type=>"QUICKLZ",
                  :deltas_in_disk_safe=>"6920703",
                  :description=>"test-MSSQL2",
                  :device_backup_type=>"AUTO_ADD_DEVICES",
                  :device_count=>"2",
                  :device_list=>{
                    :allocated_blocks=>"7843190",
                    :block_size=>"4096",
                    :capacity=>"64421359616",
                    :content_id=>"0004AFF104AFE7BC",
                    :device_content_type=>"NTFS",
                    :device_path=>"\\\\?\\Volume{1b1cac04-b25f-11e0-bc49-806e6f6e6963}",
                    :enabled=>true,
                    :mount_point=>"C:\\",
                    :mounted=>true,
                    :total_blocks=>"15727871"
                  },
                  :disk_safe_attribute_map=>{
                    :entry=>[
                      {:key=>"ARCHIVING_ENABLED", :value=>true},
                      {:key=>"FILE_EXCLUDES_ENABLED", :value=>true},
                      {:key=>"QUOTA_TYPE", :value=>"NONE"},
                      {:key=>"CONTROLPANELS_ENABLED", :value=>true},
                      {:key=>"ARCHIVE_POINT_LIMIT", :value=>"-1"},
                      {:key=>"RECOVERY_POINT_LIMIT", :value=>"-1"},
                      {:key=>"SOFT_QUOTA_VALUE", :value=>"-1.0"},
                      {:key=>"REPLICATION_FREQUENCY_LIMIT", :value=>"NO_LIMIT"},
                      {:key=>"HARD_QUOTA_VALUE", :value=>"-1.0"}
                     ]},
                   :id=>"3067f030-9814-4314-2222-75933ac29e37",
                   :open=>true,
                   :path=>"/data/test-volume/3067f030-9814-4314-ae03-75933ac29e37",
                   :recovery_point_count=>"2",
                   :size=>"20931331073",
                   :size_of_deltas_in_disk_safe=>"18665326744",
                   :total_free_pages=>"0",
                   :total_free_pages_bytes=>"0",
                   :total_page_bytes=>"20924334080",
                   :total_page_count=>"638560",
                   :volume_id=>"9b77052e-e1d3-4c51-a49a-51544fcb12e1"
                 }
               ]

      @all_disk_safes_wrapper = {
                    :get_disk_safes_response=>{
                      :return=> @all_disk_safes,
                      :"@xmlns:ns1"=>"http://disksafe.api.server.backup.r1soft.com/"
                     }
                   }
    end
  end
end
