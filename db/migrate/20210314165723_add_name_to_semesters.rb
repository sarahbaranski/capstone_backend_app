class AddNameToSemesters < ActiveRecord::Migration[6.0]
  def change
    add_column :semesters, :name, :string
  end
end
