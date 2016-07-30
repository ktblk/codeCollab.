class RemoveDocumentIdFromWorkrooms < ActiveRecord::Migration[5.0]
  def change
    remove_column :workrooms, :document_id, :integer
  end
end
