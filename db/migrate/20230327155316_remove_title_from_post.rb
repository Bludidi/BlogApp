class RemoveTitleFromPost < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :title, :string
  end
end
