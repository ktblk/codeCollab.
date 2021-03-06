class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.integer :person_to_notify
      t.string :location

      t.timestamps
    end
  end
end
