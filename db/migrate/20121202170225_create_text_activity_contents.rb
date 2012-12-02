class CreateTextActivityContents < ActiveRecord::Migration
  def change
    create_table :text_activity_contents do |t|
      t.integer :text_activity_id
      t.text :content

      t.timestamps
    end
  end
end
