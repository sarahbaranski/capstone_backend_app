class AddWorkStudyToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :work_study, :integer
  end
end
