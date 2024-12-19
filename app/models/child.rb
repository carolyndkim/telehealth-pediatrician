class Child < ApplicationRecord
    validates :name, presence: true
    validates :date_of_birth, presence: true

    belongs_to :parent
    has_many :visits, dependent: :delete_all

    scope :ordered, -> { order(:date_of_birth) }

    def previous_child
        parent.children.ordered.where("date_of_birth < ?", date_of_birth).last
    end
end
