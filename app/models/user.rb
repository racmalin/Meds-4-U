class Users < ActiveRecord::Base
    has_secure_password
    
     has_many :medications
     has_many :medications, through: :disease_states
     validates :user_id, presence: true, uniqueness: true
end