class CreateMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :medications do |t|
      t.string "name"
      t.string "type"
      t.string "brand"
      t.integer "medication_id"
      t.integer "dose"
      t.integer "quantity"
      t.text "description"
    end
  end
end