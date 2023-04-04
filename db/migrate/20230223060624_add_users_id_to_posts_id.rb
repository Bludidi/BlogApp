class AddUsersIdToPostsId < ActiveRecord::Migration[7.0]
  def change
    add_column :posts_ids, :column, :string
  end
end
