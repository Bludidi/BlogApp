class RemoveIndexFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :AuthorId 
    remove_column :comments, :PostId
  end
end
