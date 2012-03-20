module UltraVault
  class RecoveryPointService < UltraVault::SoapService
    
    def self.find_recovery_points_by_disk_safe_id(disk_safe_id)
      response_hash = client(api_request(:RecoveryPoints)).request(:getRecoveryPoints,
        :diskSafe => {:id => disk_safe_id },
        :includeMerged => false).to_hash
      extract_recovery_point_params(
          response_hash).collect do |recovery_point|
        UltraVault::RecoveryPoint.new(recovery_point)
      end

    end

    private

    def self.extract_recovery_point_params response_hash
      [response_hash[:get_recovery_points_response][:return]].flatten
    end  
  end
end