require 'savon'

module UltraVault
  
  class AgentService
    def initialize(params)
      api_request = UltraVault::ApiRequest.new(host: params[:host], port: params[:port], service: :Agent, api_verison: params[:api_version], ssl: params[:ssl])
      @client = UltraVault::Client.new endpoint: api_request.endpoint, namespace: api_request.namespace, username: params[:username], password: params[:password]
    end
    
    def find_agent_by_id(agent_id)
      UltraVault::Agent.new (@client.request :getAgentByID, { :id => agent_id }).to_hash[:get_agent_by_id_response][:return]
    end
  end
  
end