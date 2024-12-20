class Visit < ApplicationRecord
    belongs_to :parent
    belongs_to :child
    belongs_to :physician, optional: true

    scope :ordered, -> { order(:created_at) }
    scope :waiting, -> { where(visited: [nil, false]) }

    def self.waiting_visits
        Visit.waiting.ordered.count
    end

    def parent_child_names
        parent.name + " - " + child.name
    end

    def finish_visiting
        update!(visited: true, visited_at: DateTime.now)
    end

end
