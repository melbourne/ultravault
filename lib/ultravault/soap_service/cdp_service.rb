module UltraVault
  # @private  
  class CDPService < UltraVault::SoapService

    def initialize
      super(:CDP)
    end
    
    def all_cdp_servers
      response_hash = client.request(:getRegisteredCDPS).to_hash
      params = extract_params_array(response_hash,
        :get_policies_response)
      params.collect do |policy|
        UltraVault::CDP.new(policy)
      end
    end
  end
end
