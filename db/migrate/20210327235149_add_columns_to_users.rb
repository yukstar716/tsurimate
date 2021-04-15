class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :username, :string, null: false
    add_column :users, :image, :string
    add_column :users, :description, :string
  end
end
