class RemoveColumnsFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :AuthorId, :integer
    remove_column :posts, :user_id, :bigint
  end
end
