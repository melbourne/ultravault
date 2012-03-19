module UltraVault
  class RecoveryPointService < UltraVault::SoapService
    
    def initialize
      super(:RecoveryPoint)
    end
    
    def find_FOO(agent_id)
      response_hash = @client.request(:getFOO,
        :agent => {:id => agent_id }).to_hash
      extract_recovery_point_params(
          response_hash).collect do |disk_safe|
        UltraVault::DiskSafe.new(disk_safe)
      end

    end

    private

    def extract_recovery_point_params response_hash
      [response_hash[:get_FOO][:return]].flatten
    end  
  end
end