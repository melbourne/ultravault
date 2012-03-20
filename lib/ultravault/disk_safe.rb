module UltraVault
  class DiskSafe
    attr_reader :agent_id, :compression_level, :compression_type,
                  :description, :device_count, :device_list,
                  :id, :open, :recovery_point_count,
                  :volume_id, :size, :size_of_deltas
    
    def initialize(params)
      @agent_id = params[:agent_id]
      @compression_level = params[:compression_level]
      @compression_type = params[:compression_type]
      @description = params[:description]
      @device_count = params[:device_count].to_i
      @device_list = DeviceList.new(params[:device_list])
      @id = params[:id]      
      @open = params[:open]                        
      @recovery_point_count = params[:recovery_point_count].to_i
      @size = params[:size].to_i  
      @size_of_deltas = params[:size_of_deltas_in_disk_safe].to_i
      @volume_id = params[:volume_id]
      extract_attributes params[:disk_safe_attribute_map]
      recovery_points
    end
    
    def recovery_points
      UltraVault::RecoveryPointService.find_recovery_points(id)
    end                       
  
  private
  
    def extract_attributes(params)
      params[:entry].each do |entry|
        self.instance_variable_set "@#{entry[:key]}".downcase.to_sym, entry[:value]
        self.class.send(:attr_reader, entry[:key].downcase.to_sym)
      end
    end
  
    class DeviceList
      attr_reader :content_type, :path, :enabled,
                  :mount_point, :mounted, :capacity
      
      def initialize(params)
        @capacity = params[:capacity].to_i
        @content_type = params[:device_content_type]
        @path = params[:device_path] 
        @enabled = params[:enabled]
        @mount_point = params[:mount_point]
        @mounted = params[:mounted]
      end
      
      
    end
  end
end