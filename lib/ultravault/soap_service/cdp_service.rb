module UltraVault
  # @private  
  class CDPService < UltraVault::SoapService

    def initialize
      super(:CDP)
    end
    
    def all_cdp_servers
      response_hash = client.request(:getRegisteredCDPS).to_hash
      params = extract_params_array(response_hash,
        :get_registered_cdps_response)
      params.collect do |cdp|
        UltraVault::CDP.new(cdp)
      end
    end
  end
end
