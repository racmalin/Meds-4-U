class DiseaseState < ActiveRecord::Base
    
    belongs_to :medication
    belongs_to :user
    has_many :users, through: :medications

end