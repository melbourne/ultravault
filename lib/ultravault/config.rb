module UltraVault
  def self.configure
    yield(config)
  end
  
  def self.config
    @config ||= Config.new
  end
  
  def self.config=(hash)
    @config.update(hash)
  end
  
  private
  
  class Config
    attr_accessor :host, :port, :api_version,
                  :ssl, :username, :password,
                  :debug

    def initialize(params={})
      params = defaults.merge(params)
      update(params)
    end

    def update(params)
      params.each do |k,v|
        instance_variable_set("@#{k}", v)
      end
      set_debug(@debug)
    end
    
    def debug=(state)
      set_debug(state) 
    end
    
    def set_debug(state)
      Savon.configure do |config| 
        config.log = state
        HTTPI.log = state
      end
      @debug = state
    end
    
    private
    
    def defaults
      { 
        host: '', port: 0, api_version: 1,
        ssl: false, username: '', password:'',
        debug: false
      }
    end
  end 
end