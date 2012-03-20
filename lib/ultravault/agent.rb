module UltraVault
  class Agent
    attr_reader :description, :hostname, :id, :os_type, :port_number
    
    def initialize(params)
      @description = params[:description]
      @hostname = params[:hostname]
      @id = params[:id]
      @os_type = params[:os_type]
      @port_number = params[:port_number]
      disk_safes
    end

    # Disksafes belonging to this agent.
    # 
    # @return [[UltraVault::DiskSafe]] disk safes for this agent
    # @raise [Savon::SOAP::Fault] errors from the soap transaction    
    def disk_safes
      @disk_safes ||= UltraVault::DiskSafe.find_all_by_agent_id(id)
    end
    
    # Returns an agent, if found.
    # 
    # @param [String] agent_id the UUID of the agent 
    # @return [UltraVault::Agent] the agent matching the agent_id
    # @raise [Savon::SOAP::Fault] errors from the soap transaction
    def self.find_by_id(agent_id)
      UltraVault::AgentService.new.find_agent_by_id(agent_id)
    end
  end
end