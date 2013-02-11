module UltraVault
  class CDP < OpenStruct

    # Returns all cdp servers for the current user.
    # 
    # @return [[UltraVault::CDP]] current user's CDP servers
    # @raise [Savon::SOAP::Fault] errors from the soap transaction    
    def self.all
      UltraVault::CDPService.new.all_cdp_servers
    end
    
  end
end
