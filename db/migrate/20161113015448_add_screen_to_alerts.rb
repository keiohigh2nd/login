class AddScreenToAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :screen_id, :integer
  end
end
