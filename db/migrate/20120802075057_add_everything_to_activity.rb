class AddEverythingToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :name, :string
    add_column :activities, :provider_id, :integer
    add_column :activities, :quiz_size, :integer
    add_column :activities, :description, :string
    add_column :activities, :notes, :string
    add_column :activities, :duration, :integer
    
    change_table :activities do |t|
      t.has_attached_file :content_file
      t.string :type
    end    
  end
end
