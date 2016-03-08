class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.integer :user_id
      t.string :student_id
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
    add_index :parents, :user_id
    add_index :parents, :student_id
  end
end
