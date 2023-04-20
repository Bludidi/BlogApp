class AddUniqueIndexToUsersEmail < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :email, unique: true, where: "email IS NOT NULL AND email != ''"
  end
end
