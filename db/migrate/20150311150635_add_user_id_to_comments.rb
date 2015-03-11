class AddUserIdToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :user_id, :interger
  end
end
