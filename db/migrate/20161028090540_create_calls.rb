class CreateCalls < ActiveRecord::Migration[5.0]
  def change
    create_table :calls do |t|
      t.string :title
      t.text :content
      t.datetime :when
      t.integer :user_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end
