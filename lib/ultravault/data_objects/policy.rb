module UltraVault
  class Policy < OpenStruct

    # Returns an agent, if found.
    # 
    # @param [String] policy_id the UUID of the policy 
    # @return [UltraVault::Policy] the policy matching the policy_id
    # @raise [Savon::SOAP::Fault] errors from the soap transaction
    def self.find_by_id(policy_id)
      UltraVault::PolicyService.new.find_policy_by_id(policy_id)
    end

    # Returns all policies for the current user.
    # 
    # @return [[UltraVault::Policy]] current user's policies
    # @raise [Savon::SOAP::Fault] errors from the soap transaction    
    def self.all
      UltraVault::PolicyService.new.all_policies
    end
    
  end
end
