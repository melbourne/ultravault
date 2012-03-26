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
    
    def create_agent(params)
      response_hash = client.request(:createAgentWithObject,
        :agent => map_agent_params(params)).to_hash
      UltraVault::Agent.new(extract_agent_with_object_params(response_hash))   
    end
    
    def update_agent(params)
      client.request(:updateAgent,
        :agent => map_agent_params(params)).to_hash
      UltraVault::Agent.new(params)      
    end
    
    def destroy_agent(id)
      client.request(:deleteAgentById, id: id)
      nil
    end
    
    private
    
    def extract_agent_params(response_hash)
      response_hash[:get_agent_by_id_response][:return]
    end
    
    def extract_all_agents_params(response_hash)
      [response_hash[:get_agents_response][:return]].flatten
    end
    
    def extract_agent_with_object_params(response_hash)
      response_hash[:create_agent_with_object_response][:return]      
    end
    
    def extract_update_agent_params(response_hash)
      response_hash[:update_agent_response][:return]      
    end
    
    def map_agent_params(params)
      mapped_params = {}
      params.keys.each do |key|
        case key
          when :port_number
            mapped_params[:portNumber] = params[key]                             
          when :os_type
            mapped_params[:osType] = params[key]                
          else
            mapped_params[key] = params[key]  
        end
      end
      mapped_params
    end
    
  end
  
end

