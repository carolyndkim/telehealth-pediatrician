class CreateVisits < ActiveRecord::Migration[8.0]
  def change
    create_table :visits do |t|
      t.boolean :visited
      t.datetime :visted_at

      t.timestamps
    end
  end
end
