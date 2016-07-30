class RemoveUserIdFromWorkrooms < ActiveRecord::Migration[5.0]
  def change
    remove_column :workrooms, :user_id, :integer
    remove_column :workrooms, :document_id, :integer
  end
end
