class UserRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :item, :polymorphic => true
  
  def find_record(user_id, item_id, item_type)
    UserRecord.find(:first, :condition => "user_id = #{user_id} AND item_id = #{item_id} AND item_type = #{item_type}")
  end
  
end
