class AddPersonalChoreToChores < ActiveRecord::Migration[5.1]
  def change
    add_column :chores, :personal_chore, :boolean, :default => false
    add_column :chores, :chore_owner, :integer
  end
end
