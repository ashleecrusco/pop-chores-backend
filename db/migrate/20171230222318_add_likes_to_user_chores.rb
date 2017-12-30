class AddLikesToUserChores < ActiveRecord::Migration[5.1]
  def change
    add_column :user_chores, :likes, :integer, :default => 0
  end
end
