class UserRecordsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  skip_before_filter :admin_signed_in_required
  respond_to :json

  def batch_update
    @current_user = get_user_from_token
    if @current_user
      @records = JSON.parse params[:records]
      if @records
        @records.each do |record_hash|
          begin
            UserRecord.update_or_create_record(@current_user, record_hash)
          rescue
          end
        end
        respond_with({status: 200, message: "Success"}, :location => nil)
      else
        respond_with({status: 404, message: "Malformed request"}, :location => nil)
      end
    else
      respond_with({status: 400, message: "Not a valid token"}, :location => nil)
    end
  end
end
