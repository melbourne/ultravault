module UltraVault
  class Agent
    attr_reader :description, :hostname, :id, :os_type, :port_number
    
    def initialize params
      @description = params[:description]
      @hostname = params[:hostname]
      @id = params[:id]
      @os_type = params[:os_type]
      @port_number = params[:port_number]
      disk_safes
    end
    
    def disk_safes
      @disk_safes ||= UltraVault::DiskSafeService.new.find_disksafes_by_agent_id(id)
    end
    
  end
end