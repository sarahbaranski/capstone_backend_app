class CreateShiftStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :shift_requests do |t|
      t.integer :shift_id
      t.integer :student_id
      t.boolean :requested
      t.boolean :scheduled

      t.timestamps
    end
  end
end
