class CreateMengBooksTags < ActiveRecord::Migration
  def up
    create_table :meng_books_tags do |t|
      t.integer :book_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :meng_books_tags, :book_id
    add_index :meng_books_tags, :tag_id

    for item in BooksTags.all
      MengBooksTags.create book_id: item.book_id, tag_id: item.tag_id
    end
  end

  def down
    drop_table :meng_books_tags
  end
end
