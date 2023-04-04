class AddColumnSomewhere < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :poster, :string
  end
end
