require 'test/unit'
require 'shoulda'
require 'mocha'
require_relative '../../../../lib/ultravault/disk_safe'

class DiskSafeTest < Test::Unit::TestCase
  context 'A new disksafe' do
    
    setup do
      @input = {:agent_id=>"e9bd701b-dac1-4921-ab1c-467f35209e21",
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
    
    context "attributes" do
      setup do
        @disk_safe = UltraVault::DiskSafe.new(@input)
      end
      
      should "match the agent id" do
        assert_equal @disk_safe.agent_id, @input[:agent_id]
      end
      
      should "match the compression level" do
        assert_equal @disk_safe.compression_level, @input[:compression_level]
      end
      
      should "match the compression type" do
        assert_equal @disk_safe.compression_type, @input[:compression_type]
      end
      
      should "match the description" do
        assert_equal @disk_safe.description, @input[:description]
      end
      
      should "match the device count as an integer" do
        assert_equal @disk_safe.device_count, @input[:device_count].to_i
      end
      
      context "device_list" do
        setup do
          @device_list = @disk_safe.device_list
        end
        
        should "match the capacity at the right byte level" do
          assert_equal @device_list.capacity, 64421359616
        end
        
        should "match the device content type" do
          assert_equal @device_list.content_type,
            @input[:device_list][:device_content_type]
        end
        
        should "match the device path" do
          assert_equal @device_list.path,
            @input[:device_list][:device_path]
        end 
        
        should "match the enabled flag" do
          assert_equal @device_list.enabled,
            @input[:device_list][:enabled]
        end                               
        
        should "match the mount point" do
          assert_equal @device_list.mount_point,
            @input[:device_list][:mount_point]
        end                                   
        
        should "match the mounted flag" do
          assert_equal @device_list.mounted,
            @input[:device_list][:mounted]
        end
      end
      
      should "match the archiving enabled attribute" do
        assert_equal @disk_safe.archiving_enabled, true
      end
      
      should "match the file excludes enabled attribute" do
        assert_equal @disk_safe.file_excludes_enabled, true
      end                                                  
      
      should "match the quota type" do
        assert_equal @disk_safe.quota_type, 'NONE'
      end                                        
      
      should "match the control panels enabled attribute" do
        assert_equal @disk_safe.controlpanels_enabled, true
      end                                                  
      
      should "match the archive point limit attribute" do
        assert_equal @disk_safe.archive_point_limit, "-1"
      end

      should "match the recovery point limit attribute" do
        assert_equal @disk_safe.recovery_point_limit, "-1"
      end                                                
      
      should "match the soft quota value attribute" do
        assert_equal @disk_safe.soft_quota_value, "-1.0"
      end                                               
      
      should "match the replication frequency limit" do
        assert_equal @disk_safe.replication_frequency_limit,
          "NO_LIMIT"
      end                   
      
      should "match the hard quota value" do
        assert_equal @disk_safe.hard_quota_value, "-1.0"
      end
      
      should "match the id" do
        assert_equal @disk_safe.id, @input[:id]
      end                           
      
      should "match the open flag" do
        assert_equal @disk_safe.open, @input[:open]
      end                                          
      
      should "match the recovery point count as integer" do
        assert_equal @disk_safe.recovery_point_count,
          @input[:recovery_point_count].to_i
      end                                   
      
      should "match the size at the right byte level" do
        assert_equal @disk_safe.size, 20931331073
      end                                 
      
      should "match the size of deltas at the right byte level" do
        assert_equal @disk_safe.size_of_deltas, 18665326744
      end   
      
      should "match the volume id" do
        assert_equal @disk_safe.volume_id, @input[:volume_id]
      end
      
    end
  end
end