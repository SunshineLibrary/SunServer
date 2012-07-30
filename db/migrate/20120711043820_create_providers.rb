class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :intro
      t.has_attached_file :logo

      t.timestamps
    end
  end
end
