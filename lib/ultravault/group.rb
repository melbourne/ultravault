module UltraVault
  
  class Group < Base
    
    def uuid
      @uuid
    end
    
    def name
      @client.get('Name', uuid)
    end
    
    def description
      @client.get('Description', uuid)
    end
    
    def group_agent_permissions
      @client.get('GroupAgentPermissions', uuid)
    end
    
    def volume_ids
      @client.get('VolumeIDs', uuid)
    end
    
    def user_ids
      @client.get('UserIDs', uuid)
    end
    
  end
  
end