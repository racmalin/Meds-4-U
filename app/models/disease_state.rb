class DiseaseStates < ActiveRecord::Base
    has_many :users
    has_many :medications, through: :users
    belongs_to :users

end