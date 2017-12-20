class AddProfilePicToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile_pic, :string, :default => "https://i.pinimg.com/736x/3d/d9/b8/3dd9b8d4404859689ec68bffc46f158d--facebook-profile-profile-pictures.jpg"
  end
end
