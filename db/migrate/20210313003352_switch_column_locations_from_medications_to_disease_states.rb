class SwitchColumnLocationsFromMedicationsToDiseaseStates < ActiveRecord::Migration[5.2]
  def change
    add_column :disease_states, :dose, :integer
    add_column :disease_states, :quantity, :integer
    remove_column :medications, :dose 
    remove_column :medications, :quantity

  end
end
