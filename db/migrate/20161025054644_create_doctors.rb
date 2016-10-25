class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_token
      t.string :speciality
      t.string :adress

      t.timestamps
    end
  end
end
