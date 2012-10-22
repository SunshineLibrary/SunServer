class CreatePdfActivities < ActiveRecord::Migration
  def change
    create_table :pdf_activities do |t|

      t.timestamps
    end
  end
end
