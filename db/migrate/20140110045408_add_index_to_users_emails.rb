class AddIndexToUsersEmails < ActiveRecord::Migration
  def change
  	add_index :users, :emails, unique: true
  end
end
