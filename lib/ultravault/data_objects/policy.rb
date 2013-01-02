module UltraVault
  class Policy < OpenStruct

    def self.find_by_name(name)
      UltraVault::PolicyService.new.all_policies.each do |policy|
        return policy if policy.name == name
      end
    end
    
  end
end
