module UltraVault
  class SoapService
    
    def self.api_request(service)
      UltraVault::ApiRequest.new( host: UltraVault.config.host,
                                  port: UltraVault.config.port,
                                  service: service,
                                  api_verison: UltraVault.config.api_version,
                                  ssl: UltraVault.config.ssl)
    end
    
    def self.client(api_request)
      UltraVault::Client.new( endpoint: api_request.endpoint,
                              namespace: api_request.namespace,
                              username: UltraVault.config.username,
                              password: UltraVault.config.password)
    end
  end
end