class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_pro, :boolean, default: false
    add_column :users, :username, :string
  end
end
