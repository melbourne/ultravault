module UltraVault
  def self.configure
    yield(config)
  end
  
  def self.config
    @config ||= Config.new
  end
  
  private
  
  class Config
    attr_accessor :host, :port, :api_version, :ssl, :username, :password
    def initialize(host='', port=0, api_version=1, ssl=false, username='', password='')
      @host = host
      @port = port
      @api_version = api_version
      @ssl = ssl
      @username = username
      @password = password
    end    
  end 
end