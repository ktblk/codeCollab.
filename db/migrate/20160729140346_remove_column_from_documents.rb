class RemoveColumnFromDocuments < ActiveRecord::Migration[5.0]
  def change
    remove_column :documents, :workroom_id, :integer
  end
end
