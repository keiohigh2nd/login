class AddSexToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sex, :integer
  end
end
