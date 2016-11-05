class CreateSummaries < ActiveRecord::Migration[5.0]
  def change
    create_table :summaries do |t|
      t.text :sum
      t.integer :user_id

      t.timestamps
    end
  end
end
