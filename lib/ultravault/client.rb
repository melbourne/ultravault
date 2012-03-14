require 'savon'

module UltraVault
  
  class Client
    def initialize(params)
      @client = Savon::Client.new(params[:url])
      @client.connect params[:username], params[:password]
    end
  end
  
end