module UltraVault
  
  class AgentService < UltraVault::SoapService    
    
    def self.find_agent_by_id(agent_id)
      response_hash = client(api_request(:Agent)).request(:getAgentByID, :id => agent_id).to_hash
      UltraVault::Agent.new(extract_agent_params(response_hash))
    end
    
    private
    
    def self.extract_agent_params response_hash
      response_hash[:get_agent_by_id_response][:return]
    end
    
  end
  
end