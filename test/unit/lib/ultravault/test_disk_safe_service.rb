require_relative '../../../test_helper'

class DiskSafeServiceTest < Test::Unit::TestCase

  context 'a new disk safe service' do

     setup do
       @return = {
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

       @response = {
                     :get_disk_safes_for_agent_response=>{
                       :return=> @return,
                       :"@xmlns:ns1"=>"http://disksafe.api.server.backup.r1soft.com/"
                      }
                    }
     end

     context '#find_disksafes_by_agent_id' do
       setup do
         UltraVault::DiskSafeService.expects(:api_request).returns(stub(endpoint: 'foo',
             namespace: 'bar'))
         @client = stub
         UltraVault::DiskSafeService.expects(:client).returns(@client)
       end
       
       should "return an array of disksafe objects if there are any" do
         @client.expects(:request).with(
               :getDiskSafesForAgent, agent: { id: 'foo' }).returns(mock(to_hash: @response))
         UltraVault::RecoveryPointService.expects(
               :find_recovery_points).returns(stub)
         disk_safes = UltraVault::DiskSafeService.find_disksafes_by_agent_id('foo')
         assert disk_safes.each {|ds| ds.is_a? UltraVault::DiskSafe }
       end

       should "raise an error if it does not exist" do
         error = Savon::SOAP::Fault.new(stub(body: 'foo'))
        @client.expects(:request).with(
            :getDiskSafesForAgent, agent: { id: 'bar' }).raises(error)
         assert_raise Savon::SOAP::Fault do
           disk_safes = UltraVault::DiskSafeService.find_disksafes_by_agent_id('bar')
         end
       end
     end

     context "#extract_disksafe_params" do
       should "drill down into the hash" do
         assert_equal UltraVault::DiskSafeService.send(:extract_disk_safe_params, @response),
           [@return]
       end
     end
   end
  
end