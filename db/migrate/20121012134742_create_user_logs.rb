class CreateUserLogs < ActiveRecord::Migration
  def change
    create_table :user_logs do |t|
      t.integer :user_id
      t.string :app_name
      t.string :log_type
      t.string :body
      t.timestamps
    end
  end
end
