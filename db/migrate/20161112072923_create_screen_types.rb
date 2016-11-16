class CreateScreenTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :screen_types do |t|
      t.text :title
      t.string :doctor_id

      t.timestamps
    end
  end
end
