class AddForeignKeyToUsersAndPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :users_and_posts, :column, :string
  end
end
