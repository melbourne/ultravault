module UltraVault
  class Policy < OpenStruct
    attr_reader :params
    
    def initialize(params)
      @params = params
    end
    
  end
end
