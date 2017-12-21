class AddImagePicToChores < ActiveRecord::Migration[5.1]
  def change
    add_column :chores, :image_url, :string
  end
end
