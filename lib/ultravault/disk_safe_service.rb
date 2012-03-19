module UltraVault
  
  class DiskSafeService
    include UltraVault::SoapService
    
    def initialize
      build_api_request(:DiskSafe)
      build_client
    end
    
    def find_disksafes_by_agent_id(agent_id)
      response_hash = @client.request(:getDiskSafesForAgent, :agent => {:id => agent_id }).to_hash
      extract_disk_safe_params(response_hash).collect do |disk_safe|
        UltraVault::DiskSafe.new(disk_safe)
      end
  
    end
    
    private
    
    def extract_disk_safe_params response_hash
      [response_hash[:get_disk_safes_for_agent_response][:return]].flatten
    end
  end
end