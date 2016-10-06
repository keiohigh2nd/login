class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.date :note_date
      t.text :note

      t.timestamps
    end
  end
end
