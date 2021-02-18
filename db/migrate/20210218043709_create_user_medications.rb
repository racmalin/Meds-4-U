class CreateUserMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :user_medications do |t|
      t.string :user_id
      t.string :medication_id
      t.timestamps null: false
    end
  end
end
