class AddCurrentlyAssignedToChores < ActiveRecord::Migration[5.1]
  def change
    add_column :chores, :currently_assigned, :string
  end
end
