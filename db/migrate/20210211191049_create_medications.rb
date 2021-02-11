class CreateMedications < ActiveRecord::Migration[6.1]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :type
      t.string :brand
      t.integer :dose
      t.integer :quantity
      t.text :description
    end
  end
end
