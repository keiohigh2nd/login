class AddOpenflagToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :openflag, :integer
  end
end
