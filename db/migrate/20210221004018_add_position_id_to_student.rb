class AddPositionIdToStudent < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :position_id, :integer
  end
end
