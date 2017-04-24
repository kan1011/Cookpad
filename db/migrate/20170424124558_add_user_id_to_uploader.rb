class AddUserIdToUploader < ActiveRecord::Migration[5.0]
  def change
    add_column :uploaders, :user_id, :integer
  end
end
