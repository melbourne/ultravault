require 'savon'

module UltraVault
  
  class Base
    def initialize(params)
      @client = Savon::Client.new(params[:url])
      @client.connect params[:username], params[:password]
    end
    
    def client
      @client
    end
  end
  
end