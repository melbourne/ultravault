module UltraVault
  
  class Client
    
    def volumes
      get('VolumeIDs').map do |uuid|
        Volume.new(@client, uuid)
      end
    end
    
  end
  
end