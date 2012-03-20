module UltraVault
  
  class AgentService < UltraVault::SoapService    
    
    # Returns an agent, if found.
    # 
    # @param [String] agent_id the UUID of the agent 
    # @return [UltraVault::Agent] the agent matching the agent_id
    # @raise [Savon::SOAP::Fault] errors from the soap transaction
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