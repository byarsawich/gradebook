class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :student_id
      t.integer :assignment_id
      t.integer :grade

      t.timestamps null: false
    end
  end
end
