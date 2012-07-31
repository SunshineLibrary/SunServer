class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.integer :school_id
      t.integer :class_of  # graduation year from middle school
      t.integer :class_order # e.g. 1, 2, 3...

      t.timestamps
    end
  end
end
