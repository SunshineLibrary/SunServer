class CreateBooksTags < ActiveRecord::Migration
  def change
    create_table :books_tags, :id => false do |t|
      t.integer :book_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
