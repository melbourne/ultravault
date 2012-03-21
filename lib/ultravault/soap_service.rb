module UltraVault
  
  # @private
  class SoapService
    attr_reader :client
    
    def initialize(service)
      api_request = UltraVault::ApiRequest.new( host: UltraVault.config.host,
                                  port: UltraVault.config.port,
                                  service: service,
                                  api_verison: UltraVault.config.api_version,
                                  ssl: UltraVault.config.ssl) 
      @client = UltraVault::Client.new( endpoint: api_request.endpoint,
                              namespace: api_request.namespace,
                              username: UltraVault.config.username,
                              password: UltraVault.config.password)     
    end
    
  end
end