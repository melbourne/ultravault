module UltraVault
  class RecoveryPoint
    def initialize params
      @agent_id = params[:agentID]
      @created_at = Time.at(params[:createdOnTimestampInMillis] / 1000.0)
      @disk_safe_id = params[:diskSafeID]
      @id = params[:recoveryPointID]
      @state = params[:recoveryPointState].downcase
    end
    
    def agent_id
      @agent_id
    end
    
    def created_at
      @created_at
    end
    
    def disk_safe_id
      @disk_safe_id
    end
    
    def id
      @id
    end
    
    def state
      @state
    end
  end
end