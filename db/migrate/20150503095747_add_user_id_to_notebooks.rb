class AddUserIdToNotebooks < ActiveRecord::Migration
  def change
    add_column :notebooks, :user_id, :integer
  end
end
