class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :tipe
      t.integer :order
      
      t.timestamps
    end
  end
end
