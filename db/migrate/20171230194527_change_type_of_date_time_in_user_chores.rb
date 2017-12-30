class ChangeTypeOfDateTimeInUserChores < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_chores, :date_completed, :datetime
    add_column :user_chores, :date_completed, :string
  end
end
