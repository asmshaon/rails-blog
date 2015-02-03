class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, after: :id
    add_column :users, :username, :string, after: :name
  end
end
