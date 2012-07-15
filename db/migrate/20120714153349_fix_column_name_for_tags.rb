class FixColumnNameForTags < ActiveRecord::Migration
  def change
    rename_column :tags, :type, :tag_type
  end
end
