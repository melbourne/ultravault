module UltraVault::V4
  # @private  
  class DiskSafeService < UltraVault::V1::DiskSafeService

    def initialize
      super
    end
    
    def find_disksafes_by_agent_id(agent_id)
      all_disk_safes.map{ |disk_safe| disk_safe if disk_safe.agent_id == agent_id }.compact
    end
    
  end
end
