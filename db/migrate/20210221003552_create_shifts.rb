class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.integer :student_id
      t.integer :semester_id
      t.string :day
      t.integer :time
      t.boolean :requested
      t.integer :supervisor_id
      t.boolean :scheduled
      t.integer :total_required_staff

      t.timestamps
    end
  end
end
