class CreateUserChores < ActiveRecord::Migration[5.1]
  def change
    create_table :user_chores do |t|
      t.integer :chore_id
      t.integer :user_id
      t.date :due_date
      t.boolean :complete

      t.timestamps
    end
  end
end
