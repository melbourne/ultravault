module UltraVault
  # @private  
  class PolicyService < UltraVault::SoapService

    def initialize
      super(:Policy)
    end
    
    def list_policies
      response_hash = client.request(:getPolicies).to_hash
      params = extract_params_array(response_hash,
        :get_policies_response)
      params.collect do |policy|
        UltraVault::Policy.new(policy)
      end
    end
  end
end
