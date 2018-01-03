class AddCompleteCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :complete_count, :integer, :default => 0
  end
end
