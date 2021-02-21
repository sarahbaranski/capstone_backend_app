class CreateSemesters < ActiveRecord::Migration[6.0]
  def change
    create_table :semesters do |t|
      t.integer :supervisor_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
