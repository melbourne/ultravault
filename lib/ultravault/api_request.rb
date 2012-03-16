module UltraVault
  
  class ApiRequest
    def initialize(params)
      @host = params[:host]
      @port = params[:port]
      @service = params[:service]
      @ssl = params.fetch(:ssl) { true }
    end
    
    def endpoint
      "#{protocol}://#{@host}:#{@port}/#{@service}"
    end
    
    def namespace
      "http://#{@service.downcase}.api.server.backup.r1soft.com/"
    end
    
    private
    
    def protocol
      @ssl ? "https" : "http"
    end
  end
  
end