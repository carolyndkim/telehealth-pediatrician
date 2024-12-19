class AddForeignKeys < ActiveRecord::Migration[8.0]
  def change
    add_reference :children, :parent, index: true, foreign_key: true
    add_reference :visits, :parent, index: true, foreign_key: true
    add_reference :visits, :children, index: true, foreign_key: true
    add_reference :visits, :physician, index: true, foreign_key: true
  end
end
