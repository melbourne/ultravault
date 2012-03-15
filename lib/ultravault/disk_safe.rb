module UltraVault
  class DiskSafe
    attr_reader :agent_id, :compression_level, :compression_type,
                  :description, :device_count, :device_list
    
    def initialize(params)
      @agent_id = params[:agent_id]
      @compression_level = params[:compression_level]
      @compression_type = params[:compression_type]
      @description = params[:description]
      @device_count = params[:device_count].to_i
      @device_list = DeviceList.new(params[:device_list])
    end
  
  private
    require 'action_controller'
    class DeviceList
      attr_reader :content_type
      
      def initialize(params)
        @capacity = params[:capacity].to_i
        @content_type = params[:device_content_type]
      end
      
      def capacity
        ActionController::Base.helpers.
          number_to_human_size(@capacity)        
      end
      
    end
  end
end