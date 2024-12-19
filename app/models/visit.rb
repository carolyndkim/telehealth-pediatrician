class Visit < ApplicationRecord
    belongs_to :parent
    belongs_to :child
    belongs_to :physician, optional: true

    scope :ordered, -> { order(:created_at) }
end
