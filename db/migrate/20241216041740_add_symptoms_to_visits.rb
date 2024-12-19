class AddSymptomsToVisits < ActiveRecord::Migration[8.0]
  def change
    add_column :visits, :symptoms, :string
  end
end
