module UltraVault
  class RecoveryPoint
    attr_reader :agent_id, :created_at, :disk_safe_id,
                  :id, :state
    
    def initialize params
      @agent_id = params[:agent_id]
      @created_at = Time.at(params[:created_on_timestamp_in_millis].to_i / 1000.0)
      @disk_safe_id = params[:disk_safe_id]
      @id = params[:recovery_point_id]
      @state = params[:recovery_point_state].downcase
    end
    
  end
end