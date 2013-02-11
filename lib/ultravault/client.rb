module UltraVault
  # @private
  class Client
    def initialize(params)
      
      @client = Savon::Client.new do
        wsdl.endpoint = params[:endpoint] 
        wsdl.namespace = params[:namespace]
        http.auth.basic params[:username], params[:password]
        http.auth.ssl.verify_mode = :none
      end
    end
    
    def request(action, args={})
      @client.request action, :body => args
    end
  end
  
end

