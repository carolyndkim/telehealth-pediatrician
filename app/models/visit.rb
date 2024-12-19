class Visit < ApplicationRecord
    belongs_to :parent
    belongs_to :child, foreign_key: :children_id
    belongs_to :physician, optional: true

    scope :ordered, -> { order(:created_at) }
end
