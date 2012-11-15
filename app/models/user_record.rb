class UserRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :item, :polymorphic => true

  def find_record(user_id, item_id, item_type)
    UserRecord.where("user_id" => user_id, "item_id" => item_id, "item_type" => item_type).first
  end

end
