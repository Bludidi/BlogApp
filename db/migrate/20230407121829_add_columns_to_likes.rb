class AddColumnsToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :post_id, :bigint
    add_column :likes, :author_id, :bigint
    add_index :likes, :post_id
    add_foreign_key :likes, :users, column: :author_id
  end
end
