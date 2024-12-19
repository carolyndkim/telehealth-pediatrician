class Parent < ApplicationRecord
    validates :name, presence: true
    
    has_many :visits, dependent: :delete_all
    has_many :children, dependent: :delete_all

    scope :ordered, -> { order(:created_at) }

    def total_visits
        visits.count
    end
end
