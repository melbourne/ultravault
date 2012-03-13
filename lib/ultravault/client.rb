require 'savon'

module UltraVault
  
  class Client
    def initialize(params)
      @client = Savon::Client.new(params[:url])
      @client.connect params[:username], params[:password]
    end
    
    def get(attribute)
      @client.call("#{get}")
    end
    
    def set
    end
  end
  
end