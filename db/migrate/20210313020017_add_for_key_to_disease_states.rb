class AddForKeyToDiseaseStates < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :disease_states, :users, on_delete: :cascade
    add_foreign_key :disease_states, :medications, on_delete: :cascade
  end
end