class ApiController < ApplicationController
  def index    
    render :json => Api.to_json    
  end
end
