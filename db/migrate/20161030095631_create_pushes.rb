class CreatePushes < ActiveRecord::Migration[5.0]
  def change
    create_table :pushes do |t|
      t.string :title
      t.datetime :when
      t.integer :user_id
      t.string :doctor_id

      t.timestamps
    end
  end
end
