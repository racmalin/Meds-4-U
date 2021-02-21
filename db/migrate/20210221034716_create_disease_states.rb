class CreateDiseaseStates < ActiveRecord::Migration[5.2]
  def change
    create_table :disease_states do |t|
      t.string "name"
      t.string "type"
      t.string "category"
      t.integer "user_id"
      t.integer "medication_id"
    end
  end
end
