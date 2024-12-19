class ChangeVisitsChildrenId < ActiveRecord::Migration[8.0]
  def change
    rename_column :visits, :children_id, :child_id
  end
end
