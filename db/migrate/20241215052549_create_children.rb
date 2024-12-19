class CreateChildren < ActiveRecord::Migration[8.0]
  def change
    create_table :children do |t|
      t.string :name, null: false
      t.date :date_of_birth, null: false

      t.timestamps
    end
  end
end
