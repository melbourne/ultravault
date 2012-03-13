module UltraVault
  
  class User < Base
    
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
      @client.get('UserAgentPermissions', uuid)
    end
    
    def group_ids
      @client.get('GroupIDs', uuid)
    end
    
    def subuser_ids
      @client.get('SubuserIDs', uuid)
    end
    
    def volume_ids
      @client.get('VolumeIDs', uuid)
    end
    
    def attributes
      @client.get('UserAttributes', uuid)
    end
    
  end
  
end