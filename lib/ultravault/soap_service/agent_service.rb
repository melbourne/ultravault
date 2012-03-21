module UltraVault
  # @private
  class AgentService < UltraVault::SoapService    
    
    def initialize
      super(:Agent)
    end
    
    def find_agent_by_id(agent_id)
      response_hash = client.request(:getAgentByID, :id => agent_id).to_hash
      UltraVault::Agent.new(extract_agent_params(response_hash))
    end
    
    def all_agents
      response_hash = client.request(:getAgents).to_hash
      extract_all_agents_params(response_hash).collect do |agent|
        UltraVault::Agent.new(agent)
      end  
    end
    
    private
    
    def extract_agent_params(response_hash)
      response_hash[:get_agent_by_id_response][:return]
    end
    
    def extract_all_agents_params(response_hash)
      [response_hash[:get_agents_response][:return]].flatten
    end
    
  end
  
end