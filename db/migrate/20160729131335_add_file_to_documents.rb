class AddFileToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :file, :text
  end
end
