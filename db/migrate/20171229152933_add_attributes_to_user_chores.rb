class AddAttributesToUserChores < ActiveRecord::Migration[5.1]
  def change
    add_column :user_chores, :personal_chore, :boolean
    add_column :user_chores, :points, :integer
    add_column :user_chores, :title, :string
    add_column :user_chores, :image_url, :string
    remove_column :user_chores, :due_date
    add_column :user_chores, :date_completed, :datetime
  end
end
