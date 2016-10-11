class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.date :question_date
      t.text :life
      t.text :past
      t.text :family
      t.text :alle
      t.text :pharm

      t.timestamps
    end
  end
end
