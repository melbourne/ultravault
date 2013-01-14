module UltraVault::V1
  # @private  
  class PolicyService < UltraVault::SoapService

    def initialize
      super(:Policy)
    end
    
    def find_policy_by_id(policy_id)
      response_hash = client.request(:getPolicyById, :id => policy_id).to_hash
      params = extract_params(response_hash, :get_policy_by_id_response)
      UltraVault::V1::Policy.new(params)
    end
    
    def all_policies
      response_hash = client.request(:getPolicies).to_hash
      params = extract_params_array(response_hash,
        :get_policies_response)
      params.collect do |policy|
        UltraVault::V1::Policy.new(policy)
      end
    end
  end
end
