class ChangeMedicationsTypeToMedType < ActiveRecord::Migration[5.2]
  def change
    change_table :medications do |t|
      t.rename :type, :med_type
    end
  end
end
