class Medication < ActiveRecord::Base
    has_many :disease_states
    has_many :users, through: :disease_states
    belongs_to :owner, class_name: "User"

end