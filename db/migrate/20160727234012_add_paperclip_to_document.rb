class AddPaperclipToDocument < ActiveRecord::Migration[5.0]
  def change
    add_attachment :documents, :file
  end
end
