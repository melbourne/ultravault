module UltraVault
  # @private
  class RecoveryPointService < UltraVault::SoapService
    
    def initialize
      super(:RecoveryPoints)
    end
    
    def find_recovery_points_by_disk_safe_id(disk_safe_id)
      response_hash = client.request(:getRecoveryPoints,
        :diskSafe => {:id => disk_safe_id },
        :includeMerged => false).to_hash
      params = extract_params_array(response_hash,
        :get_recovery_points_response)
      params.collect do |recovery_point|
        UltraVault::RecoveryPoint.new(recovery_point)
      end

    end
  end
end