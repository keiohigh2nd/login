class AddDoctorIdToAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :doctor_id, :integer
  end
end
