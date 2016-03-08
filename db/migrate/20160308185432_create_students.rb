class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :user_id
      t.integer :teacher_id
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
    add_index :students, :user_id
    add_index :students, :teacher_id
  end
end
