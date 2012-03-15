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
        
        should "match the capacity at the write byte level" do
          assert_equal @device_list.capacity, "60 GB"
        end
        
        should "match the device content type" do
          assert_equal @device_list.content_type,
            @input[:device_list][:device_content_type]
        end
      end
    end
  end
end