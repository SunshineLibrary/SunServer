class AddNationalityToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :nationality, :string
  end
end
