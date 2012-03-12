module UltraVault
  
  class Client
    
    def groups
      get('GroupsIDs').map do |uuid|
        Group.new(@client, uuid)
      end
    end
    
  end
  
end