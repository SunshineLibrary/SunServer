class Api < ActiveRecord::Base
  def to_json
    {
      table_name: table_name,
      api_path: api_path
    }
  end
  
  def self.to_json
    json_res = []
    all.each do |api|
      json_res<<api.to_json
    end
    
    json_res
  end      
end
