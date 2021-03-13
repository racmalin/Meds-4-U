class User < ActiveRecord::Base
    has_secure_password
     
    
    has_many :disease_states
    has_many :medications, through: :disease_states
    
    
    validates :username, :email, presence: true, uniqueness: true

end