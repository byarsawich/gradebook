class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.integer :user_id
      t.integer :student_id
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
