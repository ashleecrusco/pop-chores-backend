class AddClaimedTimeToUserChores < ActiveRecord::Migration[5.1]
  def change
    add_column :user_chores, :claimed_at, :datetime
  end
end
