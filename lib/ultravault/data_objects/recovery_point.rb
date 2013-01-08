module UltraVault
  class RecoveryPoint < OpenStruct
    attr_reader :agent_id, :created_at, :disk_safe_id,
                  :id, :state
    
    def initialize(params)
      @agent_id = params[:agent_id]
      @created_at = Time.at(params[:created_on_timestamp_in_millis].to_i / 1000.0)
      @disk_safe_id = params[:disk_safe_id]
      @id = params[:recovery_point_id]
      @state = params[:recovery_point_state].downcase
    end
    
    # Returns an array of recovery points, if found.
    # 
    # @param [String] disk_safe_id the UUID of the disk safe
    # @return [[UltraVault::RecoveryPoint]] the matching recovery points for the agent
    # @raise [Savon::SOAP::Fault] errors from the soap transaction    
    def self.find_all_by_disk_safe_id(disk_safe_id)
      UltraVault::RecoveryPointService.new.find_recovery_points_by_disk_safe_id(disk_safe_id)
    end
    
  end
end