class Physician < ApplicationRecord
    validates :name, presence: true
    
    has_many :visits

    scope :ordered, -> { order(:created_at) }

    def total_visits
        visits.count
    end
end
