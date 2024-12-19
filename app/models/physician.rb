class Physician < ApplicationRecord
    validates :name, presence: true
    
    has_many :visits
end
