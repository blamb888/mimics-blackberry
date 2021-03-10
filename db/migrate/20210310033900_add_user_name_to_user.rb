class AddUserNameToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :subtitle, :string
  end
end
