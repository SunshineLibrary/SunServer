class FixProviders < ActiveRecord::Migration
  def up
    remove_column :providers, :logo_path
    
    change_table :providers do |t|
      t.has_attached_file :logo
    end
  end
  
  def down
    drop_attached_file :logo
    add_column :providers, :logo_path, :string    
  end
end
