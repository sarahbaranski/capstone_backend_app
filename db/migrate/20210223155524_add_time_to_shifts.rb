class AddTimeToShifts < ActiveRecord::Migration[6.0]
  def change
    change_column :shifts, :time, :string
  end
end
