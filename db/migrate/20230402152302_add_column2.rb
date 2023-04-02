class AddColumn2 < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :address, :string
  end
end
