module UltraVault
  
  class Volume < Base
    
    def uuid
      @uuid
    end
    
    def name
      @client.get('Name', uuid)
    end
    
    def description
      @client.get('Description', uuid)
    end
    
    def path
      @client.get('Path', uuid)
    end
    
    def quota_type
      @client.get('QuotaType', uuid)
    end
    
    def hard_quota
      @client.get('HardQuota', uuid)
    end
    
    def soft_quota
      @client.get('SoftQuota', uuid)
    end
    
    def user_ids
      @client.get('UserIDs', uuid)
    end
    
    def group_ids
      @client.get('GroupIDs', uuid)
    end
    
    def volume_attribute_map
      @client.get('VolumeAttributeMap', uuid)
    end
    
    def on_disk_size
      @client.get('OnDiskSize', uuid)
    end
    
    def siz_of_deltas
      @client.get('SizeOfDeltas', uuid)
    end
    
  end
  
end