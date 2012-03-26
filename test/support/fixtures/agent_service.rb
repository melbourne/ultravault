module UltraVault
  module Fixtures
    def load_agent_service_fixtures
      @agent_by_id =   { :database_add_on_enabled=>false,
                      :description=>"test-MSSQL",
                      :hostname=>"46.20.232.228",
                      :id=>"e9bd701b-dac1-4921-ab1c-467f35209e21",
                      :os_type=>"WINDOWS", :port_number=>"1167"
                  }
      
      @agent_by_id_wrapper = {
                    :get_agent_by_id_response=>
                     {
                       :return=> @agent_by_id,
                       :"@xmlns:ns1"=>"http://agent.api.server.backup.r1soft.com/"
                     }
                   }
      @agent_with_object_wrapper = {
                   :create_agent_with_object_response=>
                    {
                      :return=> @agent_by_id,
                      :"@xmlns:ns1"=>"http://agent.api.server.backup.r1soft.com/"
                    }
                  }
      @all_agents = [
                      { :database_add_on_enabled=>false,
                                     :description=>"test-MSSQL",
                                     :hostname=>"46.20.232.228",
                                     :id=>"e9bd701b-dac1-4921-ab1c-467f35209e21",
                                     :os_type=>"WINDOWS", :port_number=>"1167"
                      },
                      { :database_add_on_enabled=>false,
                                     :description=>"test-MSSQL2",
                                     :hostname=>"46.20.232.229",
                                     :id=>"b107db9e-dac1-4921-ab1d-12e90253f764support",
                                     :os_type=>"LINUX", :port_number=>"1168"
                      }
                    ]

      @all_agents_wrapper = {
                   :get_agents_response=>
                    {
                      :return=> @all_agents,
                      :"@xmlns:ns1"=>"http://agent.api.server.backup.r1soft.com/"
                    }
                  }
    end
  end
end