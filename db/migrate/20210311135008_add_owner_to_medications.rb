class AddOwnerToMedications < ActiveRecord::Migration[5.2]
  def change
    add_column :medications, :owner_id, :integer
  end
end
