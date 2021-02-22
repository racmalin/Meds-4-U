class User < ActiveRecord::Base
    has_secure_password
     
    #  validates :username, presence: true, uniqueness: true
    
     has_many :disease_states
     has_many :medications, through: :disease_states



end