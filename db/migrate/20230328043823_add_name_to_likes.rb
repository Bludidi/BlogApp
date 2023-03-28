class AddNameToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :name, :string
  end
end
