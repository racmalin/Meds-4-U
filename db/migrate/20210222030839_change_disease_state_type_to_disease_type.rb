class ChangeDiseaseStateTypeToDiseaseType < ActiveRecord::Migration[5.2]
  def change
    change_table :disease_states do |t|
      t.rename :type, :disease_type
    end
  end
end
