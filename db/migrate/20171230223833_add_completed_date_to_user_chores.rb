class AddCompletedDateToUserChores < ActiveRecord::Migration[5.1]
  def change
    add_column :user_chores, :completed_at, :datetime
  end
end
