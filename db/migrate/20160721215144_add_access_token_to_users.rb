class AddAccessTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :access_token, :string, null: false
    add_column :users, :expires_at, :integer, null: false
  end
end
