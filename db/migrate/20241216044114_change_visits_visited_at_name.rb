class ChangeVisitsVisitedAtName < ActiveRecord::Migration[8.0]
  def change
    rename_column :visits, :visted_at, :visited_at
  end
end
