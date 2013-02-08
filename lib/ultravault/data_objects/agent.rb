module UltraVault
  class Agent < OpenStruct
    attr_reader :description, :hostname, :id, :os_type, :port_number
    
    def initialize(params)
      @description = params[:description]
      @hostname = params[:hostname]
      @id = params[:id]
      @os_type = params[:os_type]
      @port_number = params[:port_number]
      super(params)
    end

    # Disksafes belonging to this agent.
    # 
    # @return [[UltraVault::DiskSafe]] disk safes for this agent
    # @raise [Savon::SOAP::Fault] errors from the soap transaction    
    def disk_safes
      @disk_safes = UltraVault::DiskSafe.find_all_by_agent_id(id)
    end
    
    # Returns an agent, if found.
    # 
    # @param [String] agent_id the UUID of the agent 
    # @return [UltraVault::Agent] the agent matching the agent_id
    # @raise [Savon::SOAP::Fault] errors from the soap transaction
    def self.find_by_id(agent_id)
      UltraVault::AgentService.new.find_agent_by_id(agent_id)
    end

    # Returns all agents for the current user.
    # 
    # @return [[UltraVault::Agent]] current user's agents
    # @raise [Savon::SOAP::Fault] errors from the soap transaction    
    def self.all
      UltraVault::AgentService.new.all_agents
    end
    
    # Returns a newly created agent with the given params.
    #
    # @return [UltraVault::Agent] new agent
    # @raise [Savon::SOAP::Fault] errors from the soap transaction
    def self.create(params)
      Agent.check_params_strict(params)
      UltraVault::AgentService.new.create_agent(params)
    end
    
    # Update the current agent
    #
    # @return [UltraVault::Agent] updated agent
    # @raise [Savon::SOAP::Fault] errors from the soap transaction
    def update(params)
      Agent.check_params(params)
      self.marshal_load(self.marshal_dump.merge(params))
      UltraVault::AgentService.new.update_agent(self.marshal_dump)
    end
    
    # Destroy the current agent
    # @ return [UltraVault::Agent] deleted agent
    # @raise [Savon::SOAP::Fault] errors from the soap transaction
    def destroy
      UltraVault::AgentService.new.destroy_agent(self.id)
      self
    end

    class << self
    
      USAGE = "Valid arguments - :hostname, :port_number, :description, :os_type"
      USE_ALL = "All arguments required."
      REQUIRED_PARAMS = [:hostname, :port_number, :description, :os_type]
    
      def check_params(params)
        do_check_params(false, params)
      end
    
      def check_params_strict(params)
        do_check_params(true, params)
      end
    
      def do_check_params(strict, params)
        check_params_are_legal(params)
        check_all_params_are_present(params) if strict
        true
      end
    
      def check_params_are_legal(params)
        params.keys.each do |key|
          unless REQUIRED_PARAMS.include?(key)
            raise ArgumentError.new(USAGE)
          end
        end
      end
    
      def check_all_params_are_present(params)
        REQUIRED_PARAMS.each do |key|
          unless params.keys.include?(key)
            raise ArgumentError.new("#{USAGE}. #{USE_ALL}") 
          end
        end
      end
    end
    
  end
end
