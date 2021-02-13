class Medications < ActiveRecord::Base
    has_many :disease_states
    belongs_to :users

end