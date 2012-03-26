require_relative '../../../../test_helper'

module UltraVault
  class DiskSafeTest < Test::Unit::TestCase
    context 'A new disksafe' do
    
      setup do
        load_disk_safe_fixtures
      end
    
      context "attributes" do
        setup do
          @disk_safe = DiskSafe.new(@disk_safe_params)
        end
      
        should "match the agent id" do
          assert_equal @disk_safe.agent_id, @disk_safe_params[:agent_id]
        end
      
        should "match the compression level" do
          assert_equal @disk_safe.compression_level, @disk_safe_params[:compression_level]
        end
      
        should "match the compression type" do
          assert_equal @disk_safe.compression_type, @disk_safe_params[:compression_type]
        end
      
        should "match the description" do
          assert_equal @disk_safe.description, @disk_safe_params[:description]
        end
      
        should "match the device count as an integer" do
          assert_equal @disk_safe.device_count, @disk_safe_params[:device_count].to_i
        end
      
        context "device_list" do
          setup do
            @device = @disk_safe.device_list.first
          end
        
          should "match the capacity at the right byte level" do
            assert_equal @device.capacity, 64421359616
          end
        
          should "match the device content type" do
            assert_equal @device.content_type,
              @disk_safe_params[:device_list][:device_content_type]
          end
        
          should "match the device path" do
            assert_equal @device.path,
              @disk_safe_params[:device_list][:device_path]
          end 
        
          should "match the enabled flag" do
            assert_equal @device.enabled,
              @disk_safe_params[:device_list][:enabled]
          end                               
        
          should "match the mount point" do
            assert_equal @device.mount_point,
              @disk_safe_params[:device_list][:mount_point]
          end                                   
        
          should "match the mounted flag" do
            assert_equal @device.mounted,
              @disk_safe_params[:device_list][:mounted]
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
          assert_equal @disk_safe.id, @disk_safe_params[:id]
        end                           
      
        should "match the open flag" do
          assert_equal @disk_safe.open, @disk_safe_params[:open]
        end                                          
      
        should "match the recovery point count as integer" do
          assert_equal @disk_safe.recovery_point_count,
            @disk_safe_params[:recovery_point_count].to_i
        end                                   
      
        should "match the size at the right byte level" do
          assert_equal @disk_safe.size, 20931331073
        end                                 
      
        should "match the size of deltas at the right byte level" do
          assert_equal @disk_safe.size_of_deltas, 18665326744
        end   
      
        should "match the volume id" do
          assert_equal @disk_safe.volume_id, @disk_safe_params[:volume_id]
        end
      
        should "define recovery points by api request" do
          RecoveryPointService.any_instance.expects(
                :find_recovery_points_by_disk_safe_id).with(
                @disk_safe_params[:id]).returns(stub)
          @disk_safe.recovery_points      
        end
      
      end
    
      context 'class methods' do
        should "pass on the call to the disk safe service" do
          DiskSafeService.any_instance.expects(:find_disksafes_by_agent_id).with('foo')
          DiskSafe.find_all_by_agent_id('foo')
        end
      end
    end
  end
end