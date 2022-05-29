class AddUserToAssign < ActiveRecord::Migration[6.1]
  def change
    add_column :assigns, :user_id, :int
  end
end
