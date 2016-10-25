class AddFlagToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :flag, :integer
  end
end
