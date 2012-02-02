module UltraVault
  
  class User < Base
    
    def initialize(client, uuid)
      @client = client
      @uuid = uuid
    end
    
    def uuid
      @uuid
    end
    
    def username
      @client.get('Username', uuid)
    end
    
    def password
      @client.get('Password', uuid)
    end
    
    def email_address
      @client.get('EmailAddress', uuid)
    end
    
    def user_agent_permissions
      
    end
    
    def group_ids
      
    end
    
    def subuser_ids
      
    end
    
    def volume_ids
      
    end
    
    def attributes
      
    end
    
  end
  
end