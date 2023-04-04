class RemovePostIdFromComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :name, :string
  end
end
