class CreateAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :alerts do |t|
      t.string :title
      t.text :context
      t.datetime :when
      t.integer :user_id

      t.timestamps
    end
  end
end
