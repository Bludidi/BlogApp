class AddForeignKeysToUsers < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :users, :comments, column: :author_id

  end
end
