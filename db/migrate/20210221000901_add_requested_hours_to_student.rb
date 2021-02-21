class AddRequestedHoursToStudent < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :requested_hours, :integer
  end
end
