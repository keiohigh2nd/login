class CreateScreenings < ActiveRecord::Migration[5.0]
  def change
    create_table :screenings do |t|
      t.text :title
      t.integer :user_id
      t.date :check_date

      t.timestamps
    end
  end
end
