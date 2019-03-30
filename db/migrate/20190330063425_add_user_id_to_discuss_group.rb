class AddUserIdToDiscussGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :discuss_groups, :user_id, :string
  end
end
