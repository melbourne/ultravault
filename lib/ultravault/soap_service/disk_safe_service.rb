module UltraVault
  # @private  
  class DiskSafeService < UltraVault::SoapService

    def initialize
      super(:DiskSafe)
    end
    
    def find_disksafes_by_agent_id(agent_id)
      response_hash = client.request(:getDiskSafesForAgent, :agent => {:id => agent_id }).to_hash
      params = extract_params_array(response_hash,
        :get_disk_safes_for_agent_response)
      params.collect do |disk_safe|
        UltraVault::DiskSafe.new(disk_safe)
      end
    end
    
    def all_disk_safes
      response_hash = client.request(:getDiskSafes).to_hash
      params = extract_params_array(response_hash,
        :get_disk_safes_response)
      params.collect do |disk_safe|
        UltraVault::DiskSafe.new(disk_safe)
      end
    end
  end
end
