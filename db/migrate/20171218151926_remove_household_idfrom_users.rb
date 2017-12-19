class RemoveHouseholdIdfromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :household_id
  end
end
