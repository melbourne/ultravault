module UltraVault
  class DiskSafe
    attr_reader :agent_id, :compression_level, :compression_type,
                  :description, :device_count, :device_list,
                  :id, :open, :recovery_point_count,
                  :volume_id
    
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
      @size_of_deltas = params[:size_of_deltas_in_disk_safe]
      @volume_id = params[:volume_id]
    end                         
    
    def size
      ActionController::Base.helpers.
        number_to_human_size(@size)      
    end  
    
    def size_of_deltas
      ActionController::Base.helpers.
        number_to_human_size(@size_of_deltas)      
    end
  
  private
    require 'action_controller'
    class DeviceList
      attr_reader :content_type, :path, :enabled,
                  :mount_point, :mounted
      
      def initialize(params)
        @capacity = params[:capacity].to_i
        @content_type = params[:device_content_type]
        @path = params[:device_path] 
        @enabled = params[:enabled]
        @mount_point = params[:mount_point]
        @mounted = params[:mounted]
      end
      
      def capacity
        ActionController::Base.helpers.
          number_to_human_size(@capacity)        
      end
      
    end
  end
end