class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
    add_index :teachers, :user_id
  end
end
