class AddUserIdColumnToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :author_id, :bigint
    add_foreign_key :likes, :users, column: :author_id
  end
end
