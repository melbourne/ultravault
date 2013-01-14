module UltraVault::V1
  # @private
  class AgentService < UltraVault::SoapService    
    
    def initialize
      super(:Agent)
    end
    
    def find_agent_by_id(agent_id)
      response_hash = client.request(:getAgentByID, :id => agent_id).to_hash
      params = extract_params(response_hash, :get_agent_by_id_response)
      UltraVault::V1::Agent.new(params)
    end
    
    def all_agents
      response_hash = client.request(:getAgents).to_hash
      params = extract_params_array(response_hash, :get_agents_response)
      params.collect do |agent|
        UltraVault::V1::Agent.new(agent)
      end  
    end
    
    def create_agent(params)
      response_hash = client.request(:createAgentWithObject,
        :agent => map_agent_params(params)).to_hash
        params = extract_params(response_hash,
          :create_agent_with_object_response)
      UltraVault::V1::Agent.new(params)   
    end
    
    def update_agent(params)
      client.request(:updateAgent,
        :agent => map_agent_params(params)).to_hash
      UltraVault::V1::Agent.new(params)      
    end
    
    def destroy_agent(id)
      client.request(:deleteAgentById, id: id)
      nil
    end
    
    private
    
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

