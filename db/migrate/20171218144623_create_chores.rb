class CreateChores < ActiveRecord::Migration[5.1]
  def change
    create_table :chores do |t|
      t.string :title
      t.integer :point_value
      t.string :description
      t.integer :household_id
      t.boolean :available

      t.timestamps
    end
  end
end
