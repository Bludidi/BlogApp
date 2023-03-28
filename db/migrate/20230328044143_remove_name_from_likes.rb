class RemoveNameFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :name, :string
  end
end
