module UltraVault
  class DiskSafeV2 < DiskSafeV1
    def initialize(params)
      super
    end

    # Returns an array of disk safes, if found.
    # 
    # @param [String] agent_id the UUID of the agent 
    # @return [[UltraVault::DiskSafe]] the matching disk safes for the agent
    # @raise [Savon::SOAP::Fault] errors from the soap transaction
    def self.find_all_by_agent_id(agent_id)
      all.map { |disk_safe| disk_safe if disk_safe.agent_id == agent_id }.compact
    end
  end
end
