class CreateSupervisors < ActiveRecord::Migration[6.0]
  def change
    create_table :supervisors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :password_digest

      t.timestamps
    end
  end
end
