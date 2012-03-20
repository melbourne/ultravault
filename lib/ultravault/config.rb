module UltraVault
  def self.configure
    yield(config)
  end
  
  def self.config
    @config ||= Config.new
  end
  
  private
  
  class Config
    attr_accessor :host, :port, :api_version,
                  :ssl, :username, :password,
                  :debug
                  
    def initialize(host='', port=0, api_version=1, ssl=false,
                   username='', password='', debug=false)
      @host = host
      @port = port
      @api_version = api_version
      @ssl = ssl
      @username = username
      @password = password
      debug = debug
    end
    
    def debug= state
      Savon.configure do |config| 
        config.log = state
        HTTPI.log = state
      end
      @debug = state
    end
  end 
end