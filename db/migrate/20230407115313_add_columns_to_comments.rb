class AddColumnsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :text, :text
    add_column :comments, :author_id, :bigint
    add_column :comments, :post_id, :bigint
    add_index :comments, :author_id
    add_index :comments, :post_id
    add_foreign_key :comments, :users, column: :author_id
  end
end
