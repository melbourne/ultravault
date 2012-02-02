require 'rapuncel'

module UltraVault
  class Client
    
    require 'client/users'
    
    attr_accessor :options
    
    def initialize(options)
      
      Config::VALID_OPTIONS.each do |key|
        instance_variable_set(:"@#{key}", options[key])
      end
      
    end
    
    def connect
      @client = Savon::Client.new(@url)
    end
    
    def call(method)
      @client.call(method, :login => @username, :password => @password)
    end
    
    def get(attribute, *arguments)
      call("get#{attribute}", *arguments)
    end
    
    def set(attribute, *arguments)
      call("set#{attribute}", *arguments)
    end
    
  end
end