module UltraVault
  
  class Client
    
    def users
      get('UserIDs').map do |uuid|
        User.new(@client, uuid)
      end
    end # => [User, User, User, ...]
    
  end
  
end