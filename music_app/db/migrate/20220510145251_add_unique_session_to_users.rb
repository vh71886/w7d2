class AddUniqueSessionToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :session_token, :string, unique: true
  end
end
