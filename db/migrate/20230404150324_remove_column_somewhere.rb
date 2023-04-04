class RemoveColumnSomewhere < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :poster, :string
  end
end
