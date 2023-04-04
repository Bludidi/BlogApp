class RemovePostIdFromComment < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :name, :string
  end
end
