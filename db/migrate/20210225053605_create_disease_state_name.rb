class CreateDiseaseStateName < ActiveRecord::Migration[5.2]
  def change
    add_column :medications, :disease_states_name, :string
  end
end
