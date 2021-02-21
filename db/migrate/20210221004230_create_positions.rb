class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.string :title
      t.integer :current_pay
      t.integer :previous_pay

      t.timestamps
    end
  end
end
