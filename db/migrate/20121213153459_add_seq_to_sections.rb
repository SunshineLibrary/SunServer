class AddSeqToSections < ActiveRecord::Migration
  def change
    change_table :sections do |t|
      t.integer :seq
    end
  end
end